require 'spec_helper'

describe Country do
  let(:country) { FactoryGirl.create :country }

  it { expect(country).to validate_presence_of :name }
  it { expect(country.name.size).to be_between 2, 100 }
end
