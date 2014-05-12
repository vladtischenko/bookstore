require 'spec_helper'
require 'set'
require "cancan/matchers"

describe User do
  let(:delivery) { FactoryGirl.create :delivery }
  let(:user) { FactoryGirl.create :user }

  it { expect(user).to validate_presence_of :firstname }
  it { expect(user).to validate_presence_of :lastname }
  it { expect(user).to validate_presence_of :email }
  it { expect(user).to validate_uniqueness_of :email }

  context "relations" do
    it { expect(user).to have_one :credit_card }
    it { expect(user).to have_one :bill_address }
    it { expect(user).to have_one :ship_address }
    it { expect(user).to have_many :orders }
  end

  context "callbacks" do
    it "get or create current order for user" do
      user = FactoryGirl.build :user
      expect(user).to receive(:current_order).and_return(:order)
      user.save
    end
  end

  context "methods" do
    let(:delivery) { FactoryGirl.create :delivery }

    context "to_s" do
      it "return user's firstname and lastname" do
        expect(user.to_s).to eq "#{user.firstname} #{user.lastname}"
      end
      it "return nil firstname or lastname eq nil" do
        user.firstname = nil
        expect(user.to_s).to eq nil
      end
    end
    context "current_order" do
      before do
        @order = FactoryGirl.create :order, user: user,
                  state: "in_progress", number: "R#{Time.now.to_i}"
      end
      it "return or create user's order in progress" do
        # expect(user.current_order).to eq @order
        expect(user.current_order.to_set).to eq({state: @order.state,
          number: @order.number, user_id: @order.user_id, subtotal: @order.subtotal,
          order_total: @order.order_total, delivery_id: @order.delivery_id})
      end
      it "doesn't return or create order if state not eq in_progress" do
        @order.state = 'waiting'
        @order.save
        expect(user.current_order).not_to eq @order
      end
    end
    context "current_bill_address" do
      before do
        @bill_address = FactoryGirl.create :bill_address, user: user
      end
      it "return or create user's bill address" do
        expect(user.current_bill_address).to eq @bill_address
      end
    end
    context "current_ship_address" do
      before do
        @ship_address = FactoryGirl.create :ship_address, user: user
      end
      it "return or create user's ship address" do
        expect(user.current_ship_address).to eq @ship_address
      end
    end
  end
end
