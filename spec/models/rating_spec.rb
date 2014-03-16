require 'spec_helper'

describe Rating do
  let(:user) { FactoryGirl.create :user }
  let(:book) { FactoryGirl.create :book }
  let(:rating) { FactoryGirl.create :rating, user: user, book: book }

  it { expect(rating).to validate_presence_of :title }
  it { expect(rating).to validate_presence_of :text }
  it { expect(rating).to validate_presence_of :rate }
  it { expect(rating).to validate_numericality_of :rate }
  it { expect(rating).to ensure_inclusion_of(:rate).in_range(1..5) }

  context "relations" do
    it { expect(rating).to belong_to :book }
    it { expect(rating).to belong_to :user }
  end
end
