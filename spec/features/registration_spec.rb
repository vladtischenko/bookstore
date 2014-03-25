require 'features/features_spec_helper'

feature "Registration" do
  scenario "Visitor registers successfully via register form" do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'Firstname', with: 'Vasiliy'
      fill_in 'Lastname', with: 'Pupkin'
      fill_in 'Email', with: 'pupkin@example.com'
      fill_in 'Password', with: 'qweasdzxc'
      fill_in 'Password confirmation', with: 'qweasdzxc'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario "Visitor registers fail via register form" do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'Firstname', with: 'Vasiliy'
      fill_in 'Lastname', with: 'Pupkin'
      fill_in 'Email', with: 'pupkin@example.com'
      fill_in 'Password', with: 'qweasdzxc'
      fill_in 'Password confirmation', with: 'qwe'
    end
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end
end