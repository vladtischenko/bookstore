require 'spec_helper'

describe ShipAddress do
  let(:user) { FactoryGirl.create :user }
  let(:ship_address) { FactoryGirl.create :ship_address, user: user }

  it { expect(ship_address).to validate_presence_of :firstname }
  it { expect(ship_address).to validate_presence_of :lastname }
  it { expect(ship_address).to validate_presence_of :city }
  it { expect(ship_address).to validate_presence_of :street }
  it { expect(ship_address).to validate_presence_of :phone }
  it { expect(ship_address).to validate_presence_of :zipcode }

  context "relations" do
    it { expect(ship_address).to belong_to :user }
    it { expect(ship_address).to belong_to :country }
  end

  context "methods" do
    let(:bill_address) { FactoryGirl.create :bill_address, user: user }

    context "set_ship_as_bill" do
      before do 
        user.bill_address = bill_address 
        ship_address.set_ship_as_bill(user) 
      end

      it { expect(ship_address.firstname).to eq bill_address.firstname }
      it { expect(ship_address.lastname).to eq bill_address.lastname }
      it { expect(ship_address.city).to eq bill_address.city }
      it { expect(ship_address.street).to eq bill_address.street }
      it { expect(ship_address.phone).to eq bill_address.phone }
      it { expect(ship_address.zipcode).to eq bill_address.zipcode }
      it { expect(ship_address.country).to eq bill_address.country }
    end
  end
end
