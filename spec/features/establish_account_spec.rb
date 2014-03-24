require 'features/features_spec_helper'

feature "User establish an account for remember addresses" do
  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user
    Country.stub(:all).and_return(FactoryGirl.create_list :country, 5)
    @country = Country.all.first
  end

  feature "New addresses" do
    scenario "User create bill address" do
      visit edit_user_registration_path
      within '#new_bill_address' do
        fill_in 'bill_address[firstname]', with: 'Vasiliy'
        fill_in 'bill_address[lastname]', with: 'Pupkin'
        fill_in 'bill_address[street]', with: 'st. Pushkina 10'
        fill_in 'bill_address[city]', with: 'Dnipropetrovsk'
        find("option[value='#{@country.id}']").click
        fill_in 'bill_address[zipcode]', with: '123658-8559'
        fill_in 'bill_address[phone]', with: '+380501597530'
        click_button 'SAVE'
      end
      expect(page).to have_content 'BillAddress was successfully created'
    end

    scenario "User create ship address" do
      visit edit_user_registration_path
      within '#new_ship_address' do
        fill_in 'ship_address[firstname]', with: 'Vasiliy'
        fill_in 'ship_address[lastname]', with: 'Pupkin'
        fill_in 'ship_address[street]', with: 'st. Pushkina 10'
        fill_in 'ship_address[city]', with: 'Dnipropetrovsk'
        find("option[value='#{@country.id}']").click
        fill_in 'ship_address[zipcode]', with: '123658-8559'
        fill_in 'ship_address[phone]', with: '+380501597530'
        click_button 'SAVE'
      end
      expect(page).to have_content 'ShipAddress was successfully created'
    end
  end

  feature "Update addresses" do
    background do
      @bill_address = FactoryGirl.create :bill_address, user_id: @user.id
      @ship_address = FactoryGirl.create :ship_address, user_id: @user.id
    end
    scenario "User update bill address" do
      visit edit_user_registration_path
      within "#edit_bill_address_#{@bill_address.id}" do
        fill_in 'bill_address[firstname]', with: 'Vasiliy'
        fill_in 'bill_address[lastname]', with: 'Pupkin'
        fill_in 'bill_address[street]', with: 'st. Pushkina 10'
        fill_in 'bill_address[city]', with: 'Dnipropetrovsk'
        find("option[value='#{@country.id}']").click
        fill_in 'bill_address[zipcode]', with: '123658-8559'
        fill_in 'bill_address[phone]', with: '+380501597530'
        click_button 'SAVE'
      end
      expect(page).to have_content 'BillAddress was successfully updated'
    end

    scenario "user update ship address" do
      visit edit_user_registration_path
      within "#edit_ship_address_#{@ship_address.id}" do
        fill_in 'ship_address[firstname]', with: 'Vasiliy'
        fill_in 'ship_address[lastname]', with: 'Pupkin'
        fill_in 'ship_address[street]', with: 'st. Pushkina 10'
        fill_in 'ship_address[city]', with: 'Dnipropetrovsk'
        find("option[value='#{@country.id}']").click
        fill_in 'ship_address[zipcode]', with: '123658-8559'
        fill_in 'ship_address[phone]', with: '+380501597530'
        click_button 'SAVE'
      end
      expect(page).to have_content 'ShipAddress was successfully updated'
    end
  end
end