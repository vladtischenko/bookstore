require 'features/features_spec_helper'

feature "Navigate by categories" do
  background do
    @category = FactoryGirl.create :category
    @category_without_books = FactoryGirl.create :category, title: 'best-seller'
    @book1 = FactoryGirl.create :book, title: 'War and Pease', category_id: @category.id
    @book2 = FactoryGirl.create :book, title: 'Dead Souls', category_id: @category.id
    @book3 = FactoryGirl.create :book, title: 'Anna'
  end

  scenario "User click link triller" do
    visit books_path
    click_link @category.title
    expect(page).to have_content '<< shop'
    expect(page).to have_content @book1.title
    expect(page).to have_content @book2.title
    expect(page).not_to have_content @book3.title
  end

  scenario "User click link best-seller, but not found any books" do
    visit books_path
    click_link @category_without_books.title
    expect(page).to have_content '<< shop'
    expect(page).not_to have_content @book1.title
    expect(page).not_to have_content @book2.title
    expect(page).not_to have_content @book3.title
  end
end 