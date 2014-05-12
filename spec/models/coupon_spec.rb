require 'spec_helper'

describe Coupon do
  let(:coupon) { FactoryGirl.create :coupon }

  it { expect(coupon).to validate_presence_of :code }
  it { expect(coupon).to validate_presence_of :price }
  it { expect(coupon).to validate_numericality_of :price }

  context "relations" do
    it { expect(coupon).to belong_to :order }
  end
end
