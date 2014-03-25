class ShipAddressesController < ApplicationController
  authorize_resource

  def create
    @ship_address = ShipAddress.new(ship_address_params)
    @ship_address.user = current_user

    if @ship_address.save
      redirect_to edit_user_registration_path,
        notice: t(:created, scope: [:success], obj: @ship_address.class.to_s)
    else
      redirect_to edit_user_registration_path,
        notice: t(:created, scope: [:fail], obj: @ship_address.class.to_s)
    end
  end

  def update
    if current_user.ship_address.update(ship_address_params)
      # current_user.save
      
      redirect_to edit_user_registration_path,
        notice: t(:updated, scope: [:success], obj: current_user.ship_address.class.to_s) 
    else
      redirect_to edit_user_registration_path,
        notice: t(:updated, scope: [:fail], obj: current_user.ship_address.class.to_s)
    end
  end

  private
    def ship_address_params
      params.require(:ship_address).permit(:firstname, :lastname, :city,
        :street, :phone, :zipcode, :country_id)
    end
end
