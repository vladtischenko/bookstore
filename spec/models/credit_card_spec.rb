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
  it { expect(credit_card.code.size).to eq 4 }
end
