require 'spec_helper'

describe Delivery do
  let(:delivery) { FactoryGirl.create :delivery }

  it { expect(delivery).to validate_presence_of :text }
  it { expect(delivery).to validate_presence_of :price }
  it { expect(delivery).to validate_numericality_of :price }

  context "relations" do
    it { expect(delivery).to belong_to :order }
  end

  context "scopes" do
    before do
      @deliveries = FactoryGirl.create_list :delivery, 5
      i = 0
      @deliveries.each do |delivery|
        delivery.price += i
        i += 5
        delivery.save 
      end
    end
    
    it "return deliveries ordered by price" do
      prices = []
      @deliveries.each {|delivery| prices << delivery.price}
      expect(Delivery.by_price.first.price).to eq prices.sort.first.round(2)
      expect(Delivery.by_price.last.price).to eq prices.sort.last.round(2)
    end
  end

  context "methods" do
    it "return text and price of delivery" do
      expect(delivery.to_s).to eq "#{delivery.text} #{delivery.price}"
    end
  end
end
