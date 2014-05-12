class CheckoutsController < ApplicationController

  skip_before_action :authenticate_user!, only: :set_coupon

  def complete; end
  
  def address; end
  
  def set_coupon
    if params[:code].empty?
      redirect_to :back, notice: t(:fill_coupon_field, scope: :coupon)
    else
      coupon = Coupon.find_by_code params[:code]
      if coupon
        if current_user
          current_user.current_order.coupon = coupon
          redirect_to user_orders_cart_path(current_user), notice: t(:found, scope: :coupon, price: coupon.price)
        elsif session[:order]
          @order = Order.find(session[:order])
          @order.coupon = coupon
          redirect_to session_cart_path, notice: t(:found, scope: :coupon, price: coupon.price)
        end
      else
        redirect_to :back, notice: t(:not_found, scope: :fail, obj: Coupon.to_s)
      end
    end
  end
  
  def delivery
    @deliveries = Delivery.by_price
  end

  def confirm
    if delivery = current_user.current_order.delivery
      @shipment = delivery.text
    else
      redirect_to checkout_payment_path,
        notice: t(:error, scope: [:fail])  
    end
  end

  def payment
    year = Time.now.year
    @years =  [year, year + 1, year + 2, year + 3, year + 4]
    @months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December']
  end

  def set_complete
    @order = current_user.current_order
    current_user.current_order.set_state
    flash[:notice] = t(:completed, scope: :order)
    render 'complete'
  end

  def set_delivery
    if params[:shipping]
      delivery = Delivery.find(params[:shipping])
      current_user.current_order.delivery = delivery
      redirect_to checkout_payment_path
    else
      redirect_to checkout_delivery_path,
        notice: t(:empty_field, scope: [:fail])
    end
  end

  def set_addresses
    if set_bill and set_ship
      redirect_to checkout_delivery_path
    else
      redirect_to checkout_address_path, 
        notice: t(:empty_field, scope: [:fail])
    end
  end

  private
    def bill_params
      b_params = {firstname: params[:b_firstname],
        lastname: params[:b_lastname], street: params[:b_street],
        city: params[:b_city], phone: params[:b_phone], zipcode: params[:b_zipcode],
        country_id: params[:b_country_id][:country_id]}
    end

    def ship_params
      s_params = {firstname: params[:s_firstname],
        lastname: params[:s_lastname], street: params[:s_street],
        city: params[:s_city], phone: params[:s_phone], zipcode: params[:s_zipcode],
        country_id: params[:s_country_id][:country_id]}
    end

    def set_bill
      current_user.current_bill_address.update(bill_params) ? true : false
    end

    def set_ship
      if params[:ship_as_bill]
        current_user.current_ship_address.update(bill_params) ? true : false
      else
        current_user.current_ship_address.update(ship_params) ? true : false
      end
    end
end
