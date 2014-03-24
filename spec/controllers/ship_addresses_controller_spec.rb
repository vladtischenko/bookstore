require 'spec_helper'

describe ShipAddressesController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  let(:ship_address) { FactoryGirl.create :ship_address, user: @user }
  let(:ship_address_params) {{"firstname" => ship_address.firstname,
                            "lastname" => ship_address.lastname, "city" => ship_address.city,
                            "street" => ship_address.street, "phone" => ship_address.phone,
                            "zipcode" => ship_address.zipcode, "country_id" => ship_address.country}}

  context "create action" do
    it "redirect to edit_user_registration_path with success notice" do
      @ability.can :create, ShipAddress
      post :create, id: ship_address.id, ship_address: ship_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "ShipAddress was successfully created"
    end
    it "redirect to edit_user_registration_path with failed notice" do
      @ability.can :create, ShipAddress
      ship_address.firstname = nil
      post :create, id: ship_address.id, ship_address: ship_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "ShipAddress wasn't created"
    end
  end

  context "update action" do
    it "redirect to edit_user_registration_path with success notice" do
      @ability.can :update, ShipAddress
      patch :update, id: ship_address.id, ship_address: ship_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "ShipAddress was successfully updated"
    end
    it "redirect to edit_user_registration_path with failed notice" do
      @ability.can :update, ShipAddress
      ship_address.lastname = nil
      patch :update, id: ship_address.id, ship_address: ship_address_params
      expect(response).to redirect_to edit_user_registration_path
      expect(flash[:notice]).to eq "ShipAddress wasn't updated"
    end
  end
end
