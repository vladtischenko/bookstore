require 'spec_helper'
require "cancan/matchers"

describe Ability do
  let(:user) { FactoryGirl.create :user }
  let(:ability) { Ability.new(user) }

  before do
    @order = FactoryGirl.create :order, user: user
    user.stub(:current_order).and_return(@order)
  end

  context "can" do
    context "new" do
      it { expect(ability).to be_able_to :new, Rating.new }  
    end
    context "show" do
      it { expect(ability).to be_able_to :show, Order.new }
    end
    context "index" do
      it { expect(ability).to be_able_to :index, Order.new }
    end
    context "create" do
      it { expect(ability).to be_able_to :create, OrderItem.new }
      it { expect(ability).to be_able_to :create, Order.new }
      it { expect(ability).to be_able_to :create, CreditCard.new }
      it { expect(ability).to be_able_to :create, Rating.new }
      it { expect(ability).to be_able_to :create, BillAddress.new }
      it { expect(ability).to be_able_to :create, ShipAddress.new }
    end
    context "update" do
      it { expect(ability).to be_able_to :update, BillAddress.new(user: user) }
      it { expect(ability).to be_able_to :update, ShipAddress.new(user: user) }
      it { expect(ability).to be_able_to :update, CreditCard.new(user: user) }
      it { expect(ability).to be_able_to :update, OrderItem.new(order: user.current_order) }
    end
    context "destroy" do
      it { expect(ability).to be_able_to :destroy, OrderItem.new(order: user.current_order) }
    end
    context "custom" do
      it { expect(ability).to be_able_to :empty, Order.new(user: user) }
      it { expect(ability).to be_able_to :cart, Order.new(user: user) }
    end
  end

  context "cannot" do
    context "update" do
      it { expect(ability).not_to be_able_to :update, BillAddress.new(user: nil) }
      it { expect(ability).not_to be_able_to :update, ShipAddress.new(user: nil) }
      it { expect(ability).not_to be_able_to :update, CreditCard.new(user: nil) }
      it { expect(ability).not_to be_able_to :update, OrderItem.new(order: nil) }
    end
    context "destroy" do
      it { expect(ability).not_to be_able_to :destroy, OrderItem.new(order: nil) }
    end
    context "custom" do
      it { expect(ability).not_to be_able_to :empty, Order.new(user: nil) }
      it { expect(ability).not_to be_able_to :cart, Order.new }
    end 
  end
end