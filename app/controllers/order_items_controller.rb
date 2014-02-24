class OrderItemsController < ApplicationController

  def create

    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      current_user.current_order.order_items << @order_item
      current_user.save

      redirect_to user_orders_cart_path(current_user),
        notice: t(:created, scope: [:success], obj: @order_item.class.to_s)
    else
      redirect_to root, notice: t(:created, scope: [:fail], obj: @order_item.class.to_s)
    end
  end

  def destroy

    @order_item = OrderItem.find(params[:id])
    if current_user.current_order.order_items.include? @order_item
      @order_item.destroy

      redirect_to user_orders_cart_path(current_user),
        notice: t(:destroyed, scope: [:success], obj: @order_item.class.to_s)
    else
      redirect_to user_orders_cart_path(current_user),
        notice: t(:destroyed, scope: [:fail], obj: @order_item.class.to_s)
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:book_id, :quantity, :price)
    end
end
