require 'spec_helper'

describe BillAddressesController do
  include Devise::TestHelpers

  let(:bill_address) { FactoryGirl.create :bill_address, user: @user }
  let(:bill_address_params) {{"firstname" => bill_address.firstname,
                            "lastname" => bill_address.lastname, "city" => bill_address.city,
                            "street" => bill_address.street, "phone" => bill_address.phone,
                            "zipcode" => bill_address.zipcode, "country_id" => bill_address.country}}

  before do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  context "foreign" do
    it "cannot update" do
      user = FactoryGirl.create :user
      @ability.cannot :update, BillAddress, user: user
    end
  end

  context "Not authorized user" do
    context "create action" do
      it "can't create bill address" do
        @ability.cannot :create, BillAddress
      end
      it "can't update bill address" do
        @ability.cannot :update, BillAddress
      end
    end
  end

  context "Authorized user" do 
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user 
    end
    
    context "create action" do
      it "redirect to edit_user_registration_path with success notice" do
        @ability.can :create, BillAddress
        post :create, id: bill_address.id, bill_address: bill_address_params
        expect(response).to redirect_to edit_user_registration_path
        expect(flash[:notice]).to eq "BillAddress was successfully created"
      end
      it "redirect to edit_user_registration_path with failed notice" do
        @ability.can :create, BillAddress
        bill_address.firstname = nil
        post :create, id: bill_address.id, bill_address: bill_address_params
        expect(response).to redirect_to edit_user_registration_path
        expect(flash[:notice]).to eq "BillAddress wasn't created"
      end
    end

    context "update action" do
      it "cannot foreign bill address" do
        @ability.cannot :update, BillAddress, user: nil
      end
      it "redirect to edit_user_registration_path with success notice" do
        @ability.can :update, BillAddress
        patch :update, id: bill_address.id, bill_address: bill_address_params
        expect(response).to redirect_to edit_user_registration_path
        expect(flash[:notice]).to eq "BillAddress was successfully updated"
      end
      it "redirect to edit_user_registration_path with failed notice" do
        @ability.can :update, BillAddress
        bill_address.lastname = nil
        patch :update, id: bill_address.id, bill_address: bill_address_params
        expect(response).to redirect_to edit_user_registration_path
        expect(flash[:notice]).to eq "BillAddress wasn't updated"
      end
    end
  end
end
