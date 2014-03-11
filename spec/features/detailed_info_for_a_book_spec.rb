require 'features/features_spec_helper'

feature "Detailed info for a book" do
  background do
    @book = FactoryGirl.create :book
    BooksController.stub(:news).and_return(@book)
  end

  feature "User click book title and see detaile info" do
    scenario "home page" do
      visit home_path
      click_link @book.title
      expect(page).to have_content "add review for #{@book.title}"
    end
    scenario "shop page" do
      visit books_path
      click_link @book.title
      expect(page).to have_content "add review for #{@book.title}"
    end
  end

  feature "User click book image and see detaile info" do
    scenario "home page" do
      visit home_path
      click_link @book.picture
      expect(page).to have_content "add review for #{@book.title}"
    end
    scenario "shop page" do
      visit books_path
      click_link @book.picture
      expect(page).to have_content "add review for #{@book.title}"
    end
  end
end