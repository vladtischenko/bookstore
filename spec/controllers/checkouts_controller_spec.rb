require 'spec_helper'

describe CheckoutsController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user
  end

  context "GET address" do
    it "renders address template" do
      get :address
      expect(response).to render_template :address
    end
  end

  context "GET delivery" do
    it "renders delivery template" do
      get :delivery
      expect(response).to render_template :delivery
    end
  end
  
  context "GET complete" do
    it "renders complete template" do
      get :complete
      expect(response).to render_template :complete
    end
  end

  context "GET confirm" do
    before do
      @delivery = FactoryGirl.create :delivery
      @order = FactoryGirl.create :order, delivery: @delivery
      controller.current_user.stub(:current_order).and_return(@order)
    end
    it "renders confirm template" do
      #@order.stub(:shipping).and_return(5)
      get :confirm
      expect(response).to render_template :confirm
    end
    it "redirect to checkout_payment_path" do
      @order.delivery = nil
      get :confirm
      expect(response).to redirect_to checkout_payment_path
    end
  end

  context "GET payment" do
    it "renders payment template" do
      get :payment
      expect(response).to render_template :payment
    end
  end
  
  context "GET set_complete" do
    before do
      @order = FactoryGirl.create :order
      controller.current_user.stub(:current_order).and_return(@order)
    end
    it "renders complete template" do
      get :set_complete
      expect(response).to render_template :complete
    end
    it "assigns order" do
      post :set_complete
      expect(assigns(:order)).to eq @order
    end
  end

  context "POST set_delivery" do
    let(:delivery) { FactoryGirl.create :delivery }
    it "redirect_to checkout_payment_path if shipping set" do
      post :set_delivery, shipping: delivery.id
      expect(response).to redirect_to checkout_payment_path
    end
    it "redirect_to checkout_delivery_path unless shipping set" do
      post :set_delivery
      expect(response).to redirect_to checkout_delivery_path
    end    
  end

  context "POST set_addresses" do
    before do
      controller.stub(:set_bill).and_return(true)
      controller.stub(:set_ship).and_return(true)
    end
    it "redirect_to checkout_delivery_path if bill and ship set" do
      post :set_addresses, ship_as_bill: true
      expect(response).to redirect_to checkout_delivery_path
    end
    it "redirect_to checkout_address_path unless bill set" do
      controller.stub(:set_bill).and_return(false)
      post :set_addresses
      expect(response).to redirect_to checkout_address_path
    end
    it "redirect_to checkout_address_path unless ship set" do
      controller.stub(:set_ship).and_return(false)
      post :set_addresses
      expect(response).to redirect_to checkout_address_path
    end
  end
end
