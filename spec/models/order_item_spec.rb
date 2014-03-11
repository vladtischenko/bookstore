require 'spec_helper'

describe OrderItem do
  let(:book) { FactoryGirl.create :book }
  let(:order) { FactoryGirl.create :order }
  let(:order_item) { FactoryGirl.create :order_item, book: book, order: order }

  it { expect(order_item).to validate_presence_of :quantity }
  it { expect(order_item).to validate_presence_of :price }
  it { expect(order_item).to validate_numericality_of :quantity }
  it { expect(order_item).to validate_numericality_of :price }
  # it { expect(order_item).to validate_numericality_of :total }

  context "relations" do
    it { expect(order_item).to belong_to :book }
    it { expect(order_item).to belong_to :order }
  end

  context "methods" do
    it "set total price" do
      order_item.quantity = 3
      order_item.price = 5
      order_item.set_total
      expect(order_item.total).to eq 15 
    end
  end
end
