require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "Title",
      :short_description => "MyText",
      :description => "MyText",
      :picture => "Picture",
      :in_stock => "In Stock",
      :price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Picture/)
    rendered.should match(/In Stock/)
    rendered.should match(/1.5/)
  end
end
