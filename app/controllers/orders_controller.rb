class OrdersController < ApplicationController
  authorize_resource
   
  skip_before_action :authenticate_user!, except: :index

  def show
    @order = Order.by_user(current_user).find params[:id]
  end

  def index
    @order_in_progress = current_user.current_order
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

  def empty_session_cart
    session[:order_items].each do |order_item_id|
      OrderItem.find(order_item_id).destroy
    end

    Order.find(session[:order]).destroy

    session[:order] = nil
    session[:order_items] = nil

    redirect_to session_cart_path
  end

  def session_cart
    @order_items = []
    if session[:order_items]
      session[:order_items].each do |order_item_id|
        @order_items << OrderItem.find(order_item_id)
      end
    end

    if session[:order]
      @order = Order.find(session[:order])
      @order.order_items = @order_items
      @order.set_total
      render 'cart'
    else
      @order = Order.new
      @order.for_session
      @order.order_items = @order_items
      @order.set_total
    
      if @order.save
        session[:order] = @order.id
        render 'cart'
      else
        redirect_to root_path, notice: t(:created, scope: [:fail], obj: @order.class.to_s)
      end
    end
  end    
end
