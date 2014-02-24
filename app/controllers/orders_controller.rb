class OrdersController < ApplicationController
  
  def index
    @order_in_progress = Order.where("user_id = ? AND state = ?",
                    current_user, 'in_progress').first
    @orders_waiting = Order.where("user_id = ? AND state = ?",
                    current_user, 'waiting')
    @orders_in_delivery = Order.where("user_id = ? AND state = ?",
                    current_user, 'in_delivery')
    @orders_delivered = Order.where("user_id = ? AND state = ?",
                    current_user, 'delivered')
  end

  def cart
    @order = Order.where("user_id = ? AND state = ?",
                    current_user, 'in_progress').first
    @order.set_subtotal
    @order.save
  end

  def empty
    @order = Order.where("user_id = ? AND state = ?",
                    current_user, 'in_progress').first
    @order.empty_cart

    redirect_to '/home'
  end
end
