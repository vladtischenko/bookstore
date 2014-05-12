class OrderItemsController < ApplicationController
  authorize_resource

  skip_before_action :authenticate_user!

  def create
    @order_item = OrderItem.new(order_item_params)

    if current_user
      if @order_item.save
        redirect_to user_orders_cart_path(current_user),
          notice: t(:created, scope: [:success], obj: @order_item.class.to_s)
      else
        redirect_to root_path, notice: t(:created, scope: [:fail], obj: @order_item.class.to_s)
      end      
    else
      @order_item.order_id = 0

      if @order_item.save
        session[:order_items] = [] unless session[:order_items]
        session[:order_items] << @order_item.id

        redirect_to session_cart_path
      else
        redirect_to root_path, notice: t(:created, scope: [:fail], obj: @order_item.class.to_s)
      end
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])

    if current_user
      if @order_item.destroy
        redirect_to user_orders_cart_path(current_user),
          notice: t(:destroyed, scope: [:success], obj: @order_item.class.to_s)
      else
        redirect_to user_orders_cart_path(current_user),
          notice: t(:destroyed, scope: [:fail], obj: @order_item.class.to_s)
      end
    else
      session[:order_items].delete params[:id].to_i

      OrderItem.find(params[:id]).destroy

      if session[:order_items].empty?
        Order.find(session[:order]).destroy
        session[:order] = nil
        session[:order_items] = nil
      end

      redirect_to session_cart_path
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:book_id, :quantity, :price, :order_id)
    end
end
