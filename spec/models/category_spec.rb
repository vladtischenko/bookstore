require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create :category }

  it { expect(category).to validate_presence_of :title }
  it { expect(category.title.size).to be_between 2, 15 }

  context "relations" do
    it { expect(category).to have_many :books }
  end
end
