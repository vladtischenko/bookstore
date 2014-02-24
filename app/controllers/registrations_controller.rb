class RegistrationsController < Devise::RegistrationsController

  def edit
    @bill_address = BillAddress.where(:user_id => current_user.id).first_or_create
    @ship_address = ShipAddress.where(:user_id => current_user.id).first_or_create
    @countries = Country.all
  end

end 