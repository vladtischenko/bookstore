require 'spec_helper'

describe OrdersController do
  include Devise::TestHelpers

  let(:order) { FactoryGirl.create :order }
  let(:order_params) {{"order_total"=>order.order_total, "shipping"=>order.shipping,
                      "subtotal"=>order.subtotal, "number"=>order.number, "state"=>order.state}}


  before do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  context "Authorized user" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user
    end

    context "GET show" do
      before do
        Order.stub(:by_user).and_return(@user)
        @user.stub(:find).and_return(order)
        @ability.can :show, Order
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
        @ability.can :index, Order
        get :index
        expect(response).to render_template :index  
      end
    end
    
    context "GET cart" do
      it "renders cart template" do
        @ability.can :cart, Order
        get :cart, user_id: @user.id
        expect(response).to render_template :cart
      end
    end
    
    context "GET empty" do
      it "redirect to root_path" do
        @ability.can :empty, Order
        get :empty, user_id: @user.id
        expect(response).to redirect_to root_path
      end
    end
  end

  context "foreign" do
    before do
      @fake_user = FactoryGirl.create :user
    end
    it "cannot empty" do
      @ability.cannot :empty, Order, user: @fake_user
    end
    it "cannot cart" do
      @ability.cannot :cart, Order, user: @fake_user
    end
  end

  context "Not authorized user" do
    it "GET empty_session_cart" do
      @ability.can :empty_session_cart, Order
      book = FactoryGirl.create :book
      session[:order] = order
      session[:order_items] = []
      session[:order_items].push FactoryGirl.create :order_item, order: order, book: book
      get :empty_session_cart
      expect(response).to redirect_to session_cart_path
    end
    it "GET session_cart" do
      @ability.can :session_cart, Order
      get :session_cart
      expect(response).to render_template 'cart'
    end
    context "cannot" do
      it "GET empty" do
        @ability.cannot :empty, Order
      end
      it "GET cart" do
        @ability.cannot :cart, Order
      end
    end
  end
end
