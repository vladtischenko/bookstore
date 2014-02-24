require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :short_description => "MyText",
      :description => "MyText",
      :picture => "MyString",
      :in_stock => "MyString",
      :price => 1.5
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "textarea#book_short_description[name=?]", "book[short_description]"
      assert_select "textarea#book_description[name=?]", "book[description]"
      assert_select "input#book_picture[name=?]", "book[picture]"
      assert_select "input#book_in_stock[name=?]", "book[in_stock]"
      assert_select "input#book_price[name=?]", "book[price]"
    end
  end
end
