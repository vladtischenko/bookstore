class BillAddressesController < ApplicationController
  def create
    @bill_address = BillAddress.new(bill_address_params)

    if @bill_address.save
      current_user.bill_address = @bill_address
      current_user.save

      redirect_to edit_user_registration_path,
        notice: t(:created, scope: [:success], obj: @bill_address.class.to_s)
    else
      redirect_to edit_user_registration_path,
        notice: t(:created, scope: [:fail], obj: @bill_address.class.to_s)
    end
  end

  def update
    if current_user.bill_address.update(bill_address_params)
      current_user.save
      
      redirect_to edit_user_registration_path,
        notice: t(:updated, scope: [:success], obj: current_user.bill_address.class.to_s)
    else
      redirect_to edit_user_registration_path,
        notice: t(:updated, scope: [:fail], obj: current_user.bill_address.class.to_s)
    end
  end

  private
    def bill_address_params
      params.require(:bill_address).permit(:firstname, :lastname, :city,
        :street, :phone, :zipcode, :country_id)
    end
end
