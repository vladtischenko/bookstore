require 'spec_helper'

describe OrdersController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user
  end

  let(:order) { FactoryGirl.create :order }
  let(:order_params) {{"order_total"=>order.order_total, "shipping"=>order.shipping,
                      "subtotal"=>order.subtotal, "number"=>order.number, "state"=>order.state}}

  context "GET show" do
    before do
      Order.stub(:by_user).and_return(@user)
      @user.stub(:find).and_return(order)
    end
    it "renders show template" do
      get :show, id: order.id
      expect(response).to render_template :show
    end
    it "assigns order" do
      get :show, id: order.id
      expect(assigns(:order)).to eq order
    end
  end

  context "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template :index  
    end
  end
  
  context "GET cart" do
    it "renders cart template" do
      get :cart, user_id: @user.id
      expect(response).to render_template :cart
    end
  end
  
  context "GET empty" do
    it "redirect to root_path" do
      get :empty, user_id: @user.id
      expect(response).to redirect_to root_path
    end
  end
end
