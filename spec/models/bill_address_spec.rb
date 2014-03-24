require 'spec_helper'

describe BillAddress do
  let(:bill_address) { FactoryGirl.create :bill_address }

  it { expect(bill_address).to validate_presence_of :firstname }
  it { expect(bill_address).to validate_presence_of :lastname }
  it { expect(bill_address).to validate_presence_of :city }
  it { expect(bill_address).to validate_presence_of :street }
  it { expect(bill_address).to validate_presence_of :phone }
  it { expect(bill_address).to validate_presence_of :zipcode }

  context "relations" do
    it { expect(bill_address).to belong_to :user }
    it { expect(bill_address).to belong_to :country }
  end
end
