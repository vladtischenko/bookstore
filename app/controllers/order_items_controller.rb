class OrderItemsController < ApplicationController
  
  def create
    @order_item = OrderItem.new(order_item_params)
    
    if @order_item.save
      current_user.orders.where("user_id = ? AND state = ?",
        current_user, 'in_progress').first.order_items << @order_item
      current_user.save
      redirect_to "/users/#{current_user.id}/orders/cart",
                  notice: "OrderItem was successfully created"
    else
      redirect_to '/home', notice: "OrderItem is not saved!!!"
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to "/users/#{current_user.id}/orders/cart"
  end

  private
    def order_item_params
      params.require(:order_item).permit(:book_id, :quantity, :price)
    end
end
