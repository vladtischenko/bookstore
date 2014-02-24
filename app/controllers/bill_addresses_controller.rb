class BillAddressesController < ApplicationController
  def create
    @countries = Country.all
    @bill_address = BillAddress.new(bill_address_params)

    if @bill_address.save
      current_user.bill_address = @bill_address
      current_user.save

      redirect_to '/users/edit', notice: "BillAddress was successfully created"
    else
      redirect_to '/users/edit', notice: "An error has occured"
    end
  end

  def update
    @countries = Country.all
    @bill_address = BillAddress.find(params[:id])
    if @bill_address.update(bill_address_params)
      current_user.bill_address = @bill_address
      current_user.save
      redirect_to '/users/edit', notice: "BillAddress was successfully updated" 
    else
      redirect_to '/users/edit', notice: "An error has occured"
    end
  end

  private
    def bill_address_params
      params.require(:bill_address).permit(:firstname, :lastname, :city,
        :street, :phone, :zipcode, :country_id)
    end
end
