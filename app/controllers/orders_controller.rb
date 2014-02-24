class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  def index
    @order_in_progress = current_user.current_order
    @orders_waiting = Order.waiting current_user
    @orders_in_delivery = Order.in_delivery current_user
    @orders_delivered = Order.delivered current_user
  end

  def cart
    @order = current_user.current_order
  end

  def empty
    current_user.current_order.empty_cart
    redirect_to root
  end
end
