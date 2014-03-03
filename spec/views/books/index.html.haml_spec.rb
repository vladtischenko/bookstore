require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :title => "Title",
        :short_description => "MyText",
        :description => "MyText",
        :picture => "Picture",
        :in_stock => "In Stock",
        :price => 1.5
      ),
      stub_model(Book,
        :title => "Title",
        :short_description => "MyText",
        :description => "MyText",
        :picture => "Picture",
        :in_stock => "In Stock",
        :price => 1.5
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "In Stock".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
