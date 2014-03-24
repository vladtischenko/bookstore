require 'features/features_spec_helper'

feature "User can add review for book" do
  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user
    @book = FactoryGirl.create :book
  end

  scenario "User click add review for book" do
    visit book_path(@book)
    click_link "add review for #{@book.title}"
    expect(page).to have_content "New review for #{@book.title}"
  end 
end