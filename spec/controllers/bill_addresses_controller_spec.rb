require 'spec_helper'

describe BillAddressesController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user
  end

  let(:bill_address) { FactoryGirl.create :bill_address, user: @user }
  let(:bill_address_params) {{"firstname" => bill_address.firstname,
                            "lastname" => bill_address.lastname, "city" => bill_address.city,
                            "street" => bill_address.street, "phone" => bill_address.phone,
                            "zipcode" => bill_address.zipcode, "country_id" => bill_address.country}}

  context "create action" do
    it "redirect to edit_user_registration_path with success notice" do
      post :create, id: bill_address.id, bill_address: bill_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "BillAddress was successfully created"
    end
    it "redirect to edit_user_registration_path with failed notice" do
      bill_address.firstname = nil
      post :create, id: bill_address.id, bill_address: bill_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "BillAddress wasn't created"
    end
  end

  context "update action" do
    it "redirect to edit_user_registration_path with success notice" do
      patch :update, id: bill_address.id, bill_address: bill_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "BillAddress was successfully updated"
    end
    it "redirect to edit_user_registration_path with failed notice" do
      bill_address.lastname = nil
      patch :update, id: bill_address.id, bill_address: bill_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "BillAddress wasn't updated"
    end
  end
end
