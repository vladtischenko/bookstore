require 'spec_helper'

describe OrderItemsController do
  include Devise::TestHelpers

  let(:book) { FactoryGirl.create :book }
  let(:order) { FactoryGirl.create :order }
  let!(:order_item) { FactoryGirl.create :order_item, order: order, book: book }
  let(:order_item_params) {{"price"=>order_item.price.to_s, "quantity"=>order_item.quantity.to_s,
                          "book_id"=>order_item.book_id.to_s, "order_id"=>order_item.order_id.to_s}}
  
  before do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  context "foreign" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user

      @fake_user = FactoryGirl.create :user
    end
    it "cannot destroy" do
      @ability.cannot :destroy, OrderItem, order: FactoryGirl.create(:order, user: @fake_user)
    end
    it "cannot update" do
      @ability.cannot :update, OrderItem, order: FactoryGirl.create(:order, user: @fake_user)
    end
  end

  context "Authorized user" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user
    end

    context "POST create" do
      before do
        @user.stub(:current_order).and_return(order)
        @ability.can :create, OrderItem
      end
      it "redirect_to user_orders_cart_path if order_item was created" do
        post :create, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to user_orders_cart_path(@user)
        expect(flash[:notice]).to eq "OrderItem was successfully created"
      end
      it "redirect_to root_path if order_item wasn't created" do
        order_item.quantity = nil
        post :create, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq "OrderItem wasn't created"
      end
    end

    context "DELETE destroy" do
      it "redirect_to user_orders_cart_path(current_user)
          if order_item was destroyed with success notice" do
        @ability.can :destroy, OrderItem
        delete :destroy, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to user_orders_cart_path(@user)
        expect(flash[:notice]).to eq "OrderItem was successfully destroyed"
      end
    end
  end

  context "Not authorized user" do
    context "POST create" do
      it "redirect_to session_cart_path if order_item was created" do
        @ability.can :create, OrderItem
        post :create, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to session_cart_path
      end
      it "redirect_to root_path if order_item wasn't created" do
        @ability.can :create, OrderItem
        order_item.quantity = nil
        post :create, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq "OrderItem wasn't created"
      end
    end
    context "DELETE destroy" do
      it "redirect_to session_cart_path if order_item was destroyed" do
        @ability.can :destroy, OrderItem
        session[:order_items] = []
        session[:order_items].push FactoryGirl.create :order_item, order: order, book: book
        delete :destroy, id: order_item.id, order_item: order_item_params
        expect(response).to redirect_to session_cart_path
      end
    end
  end                    
end
