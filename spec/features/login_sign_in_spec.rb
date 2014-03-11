require 'features/features_spec_helper'

feature "Login/sing in" do
  background do
    @user = FactoryGirl.create :user
  end

  scenario "Visitor login successfully via login form" do
    visit new_user_session_path
    within '#new_user' do
      fill_in 'Email', with: 'pupkin@example.com'
      fill_in 'Password', with: '12345678'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario "Visitor login fail via login form" do
    visit new_user_session_path
    within '#new_user' do
      fill_in 'Email', with: 'pupkin@example.com'
      fill_in 'Password', with: 'qweasdzxc'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password.'
  end
end