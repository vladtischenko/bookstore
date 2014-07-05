require 'spec_helper'

describe CreditCard do
  let(:user) { FactoryGirl.create :user }
  let(:credit_card) { FactoryGirl.create :credit_card, user: user }

  it { expect(credit_card).to validate_presence_of :card_number }
  it { expect(credit_card).to validate_presence_of :user_id }
  it { expect(credit_card).to validate_presence_of :code }
  it { expect(credit_card).to validate_presence_of :expiration_year }
  it { expect(credit_card).to validate_presence_of :expiration_month }
  it { expect(credit_card).to validate_numericality_of :expiration_year }
  it { expect(credit_card).to validate_numericality_of :card_number }
  it { expect(credit_card).to validate_numericality_of :user_id }
  it { expect(credit_card).to validate_numericality_of :code }
  it { expect(credit_card.code.size).to eq 3 }
  it { expect(credit_card.card_number.length).to eq 16 }

  context "callbacks" do
    it "call check_date before save" do
      credit_card = FactoryGirl.build :credit_card, user: user
      expect(credit_card).to receive :check_date
      credit_card.save
    end
  end

  context "methods" do
    it "returns true if time now less than expiration_date" do
      credit_card.expiration_month = "May"
      credit_card.expiration_year = Time.now.year + 1
      expect(credit_card.check_date).to eq true
    end
    it "returns faslse if expiration_date less than time now" do
      credit_card.expiration_month = "February"
      credit_card.expiration_year = 2014
      expect(credit_card.check_date).to eq false
    end
  end
end
