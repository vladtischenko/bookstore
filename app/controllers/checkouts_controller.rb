class CheckoutsController < ApplicationController
  def address; end
  def delivery; end
  def complete; end

  def confirm
    shipping = current_user.current_order.shipping
    if shipping == 5
      @shipment = 'UPS ground'
    elsif shipping == 10
      @shipment = 'UPS two days'
    elsif shipping == 15
      @shipment = 'UPS one day'
    else
      redirect_to checkout_payment_path, notice: t(:error, scope: [:fail])
    end
  end

  def payment
    @years =  ['2014', '2015', '2016', '2017', '2018']
    @months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December']
  end

  def set_complete
    @order = current_user.current_order
    shipping = current_user.current_order.shipping
    if shipping == 5
      @shipment = 'UPS ground'
    elsif shipping == 10
      @shipment = 'UPS two days'
    else
      @shipment = 'UPS one day'
    end
    current_user.current_order.set_state
    render 'complete'
  end

  def set_delivery
    if params[:shipping]
      if params[:shipping] == 'ground'
        number = 5
      elsif params[:shipping] == 'two_days'
        number = 10
      elsif params[:shipping] == 'one_day'
        number = 15
      end
      current_user.current_order.set_total(number).save
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
