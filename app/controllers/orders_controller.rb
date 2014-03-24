class OrdersController < ApplicationController
  authorize_resource
   
  def show
    @order = Order.by_user(current_user).find params[:id]
  end

  def index
    @order_in_progress = current_user.current_order
    # orders = Order.by_user current_user
    orders = current_user.orders
    @orders_waiting = orders.waiting
    @orders_in_delivery = orders.in_delivery
    @orders_delivered = orders.delivered
  end

  def cart
    @order = current_user.current_order
  end

  def empty
    current_user.current_order.empty_cart
    redirect_to root_path
  end
end
