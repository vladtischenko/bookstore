require 'features/features_spec_helper'

feature "User put book into shopping cart" do

  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user

    @book = FactoryGirl.create :book
    BooksController.stub(:news).and_return(@book)
  end

  scenario "User click 'add to cart' button from home page and book add to his cart" do
    visit home_path
    click_button 'add to cart'
    expect(page).to have_content 'OrderItem was successfully created'
  end

  scenario "User click 'add to cart' button from shop page and book add to his cart" do
    visit book_path(@book)
    click_button 'add to cart'
    expect(page).to have_content 'OrderItem was successfully created'
  end
end