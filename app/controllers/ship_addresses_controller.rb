class ShipAddressesController < ApplicationController
  def create
    @countries = Country.all
    @ship_address = ShipAddress.new(ship_address_params)

    if @ship_address.save
      current_user.ship_address = @ship_address
      current_user.save

      redirect_to '/users/edit', notice: "ShipAddress was successfully created"
    else
      redirect_to '/users/edit', notice: "An error has occured"
    end
  end

  def update
    @countries = Country.all
    @ship_address = ShipAddress.find(params[:id])
    if @ship_address.update(ship_address_params)
      current_user.ship_address = @ship_address
      current_user.save
      redirect_to '/users/edit', notice: "ShipAddress was successfully updated" 
    else
      redirect_to '/users/edit', notice: "An error has occured"
    end
  end

  private
    def ship_address_params
      params.require(:ship_address).permit(:firstname, :lastname, :city,
        :street, :phone, :zipcode, :country_id)
    end
end
