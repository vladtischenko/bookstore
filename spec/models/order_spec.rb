require 'spec_helper'

describe Order do
  let(:delivery) { FactoryGirl.create :delivery, price: 10.0 }
  let(:order) { FactoryGirl.create :order, delivery: delivery }

  it { expect(order).to validate_presence_of :state }
  it { expect(order).to validate_presence_of :number }
  it { expect(order).to validate_numericality_of :order_total }
  it { expect(order).to validate_numericality_of :subtotal }

  context "relations" do
    it { expect(order).to belong_to :user }
    it { expect(order).to have_many :order_items }
    it { expect(order).to have_one :delivery }
  end

  context "callbacks" do
    it "set total before save" do
      order = FactoryGirl.build :order
      expect(order).to receive(:set_total)
      order.save
    end
  end

  context "scopes" do

    context "by_user" do
      before do
        @user = double("user", email: "pupkin@example.com", firstname: "Vasiliy",
          lastname: "Pupkin", password: "12345678", id: 1)
        @orders = FactoryGirl.create_list :order, 1, user_id: @user.id, delivery: delivery
      end

      it "return orders by exactly user" do
        expect(Order.by_user(@user)).to match_array @orders
      end
      it "doesn't return order with outher user" do
        order = FactoryGirl.create :order, delivery: delivery
        @orders << order
        expect(Order.by_user(@user)).not_to match_array @orders
      end
    end

    context "in_progress" do
      before do
        @orders = FactoryGirl.create_list :order, 5, state: 'in_progress', delivery: delivery
      end
      it "return orders where state in_progress" do
        expect(Order.in_progress).to match_array @orders
      end
      it "doesn't return order if state not eq in_progress" do
        order = FactoryGirl.create :order, delivery: delivery, state: 'waiting'
        @orders << order
        expect(Order.in_progress).not_to match_array @orders
      end
    end

    context "waiting" do
      before do
        @orders = FactoryGirl.create_list :order, 5, state: 'waiting', delivery: delivery
      end
      it "return orders where state waiting" do
        expect(Order.waiting).to match_array @orders
      end
      it "doesn't return order if state not eq waiting" do
        order = FactoryGirl.create :order, delivery: delivery
        @orders << order
        expect(Order.waiting).not_to match_array @orders
      end
    end

    context "in_delivery" do
      before do
        @orders = FactoryGirl.create_list :order, 5, state: 'in_delivery', delivery: delivery
      end
      it "return orders where state in_delivery" do
        expect(Order.in_delivery).to match_array @orders
      end
      it "doesn't return order if state not eq in_delivery" do
        order = FactoryGirl.create :order, delivery: delivery
        @orders << order
        expect(Order.in_delivery).not_to match_array @orders
      end
    end

    context "delivered" do
      before do
        @orders = FactoryGirl.create_list :order, 5, state: 'delivered', delivery: delivery
      end
      it "return orders where state delivered" do
        expect(Order.delivered).to match_array @orders
      end
      it "doesn't return order if state not eq delivered" do
        order = FactoryGirl.create :order, delivery: delivery
        @orders << order
        expect(Order.delivered).not_to match_array @orders
      end
    end
  end

  context "methods" do
    context "set_total" do
      before do
        book = FactoryGirl.create :book
        @order_items = FactoryGirl.create_list :order_item, 5,
                                    book: book, order: order, quantity: 2, price: 5
        order.order_items = @order_items
      end
      it "set subtotal" do
        order.set_total
        expect(order.subtotal).to eq 50
      end
    end

    context "set_state" do
      it "change state to 'waiting'" do
        order.set_state
        expect(order.state).to eq 'waiting'
      end
    end
    
    context "empty_cart" do
      before { order.empty_cart }
      it "clean order_items array" do
        expect(order.order_items).to eq []
      end
      it "reset subtotal" do
        expect(order.subtotal).to eq 0
      end
      it "reset delivery" do
        expect(order.delivery).to eq nil
      end
      it "reser order_total" do
        expect(order.order_total).to eq 0
      end
    end
  end
end
