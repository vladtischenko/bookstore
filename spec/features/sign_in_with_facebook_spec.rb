require 'features/features_spec_helper'

feature "User sign in with facebook" do
  
  background do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '123545',
      :info => {
        :email => 'dog@example.com',
        :password => '12345678',
        :first_name => 'Ivan',
        :last_name => 'Petrov'
      }
    })
  end

  scenario "User visit registration page and click link 'Sign me with Facebook'" do
    visit new_user_registration_path
    click_link 'Sign in with Facebook'
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end
  
  scenario "User visit login page and click link 'Sign me with Facebook'" do
    visit new_user_session_path
    click_link 'Sign in with Facebook'
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end
end