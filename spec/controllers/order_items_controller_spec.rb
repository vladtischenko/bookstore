require 'spec_helper'

describe OrderItemsController do
  include Devise::TestHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
  end

  let(:book) { FactoryGirl.create :book }
  let(:order) { FactoryGirl.create :order }
  let!(:order_item) { FactoryGirl.create :order_item, order: order, book: book }
  let(:order_item_params) {{"price"=>order_item.price.to_s, "quantity"=>order_item.quantity.to_s,
                          "book_id"=>order_item.book_id.to_s, "order_id"=>order_item.order_id.to_s}}
  
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
