require 'features/features_spec_helper'

feature "User can add book to the shopping cart and make checkout" do
  background do
    @book = FactoryGirl.create :book
  end

  context "Authorized user" do
    background do
      @user = FactoryGirl.create :user
      login_as @user, scope: :user
    end
    
    scenario "User click button 'add to cart'" do
      visit root_path
      click_button 'add to cart'
      expect(page).to have_content @book.title
    end
    scenario "User click checkout button" do
      visit root_path
      click_button 'add to cart'
      visit user_orders_cart_path(@user)
      click_link 'checkout'
      expect(page).to have_content 'Checkout'
    end
  end
  
  context "Not authorized user" do
    scenario "User click 'add to cart'" do
      visit root_path
      click_button 'add to cart'
      expect(page).to have_content @book.title
    end
    scenario "User click checkout button" do
      visit root_path
      click_button 'add to cart'
      visit session_cart_path
      click_link 'checkout'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end