require 'spec_helper'

describe Author do
  let(:author) { FactoryGirl.create :author }

  it { expect(author).to validate_presence_of :firstname }
  it { expect(author).to validate_presence_of :lastname }
  it { expect(author.firstname.size).to be_between 2, 20 }
  it { expect(author.lastname.size).to be_between 2, 20 }
  it { expect(author).to have_many :books }

  context "with set fields" do
    let(:author) { FactoryGirl.build :author, firstname: "Lev", lastname: "Tolstoy" }
    it { expect(author.firstname).to eq "Lev" }
    it { expect(author.lastname).to eq "Tolstoy" }
  end
end
