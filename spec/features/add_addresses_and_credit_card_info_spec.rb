require 'features/features_spec_helper'

feature "User add addresses and credit card info" do
  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user

    Delivery.stub(:by_price).and_return(FactoryGirl.create_list :delivery, 5)
    @delivery = Delivery.by_price.first
    @order = FactoryGirl.create :order, user_id: @user.id, state: 'in_progress', delivery: @delivery
    @book = FactoryGirl.create :book
    @order_items = FactoryGirl.create_list :order_item, 2, book_id: @book.id, order_id: @order.id
    @order.order_items = @order_items
    @user.stub(:current_order).and_return(@order)

    Country.stub(:all).and_return(FactoryGirl.create_list :country, 5)
    @country = Country.all.first
  end

  scenario "User set delivery" do
    visit checkout_delivery_path
    within '#delivery' do
      find("#shipping_#{@delivery.id}").set(true)
      click_button 'SAVE AND CONTINUE'
    end
    expect(page).to have_content 'CREDIT CARD'
  end

  scenario "User fill bill address info" do
    visit user_orders_cart_path(@user)
    click_button 'checkout'
    expect(page).to have_content 'BILLING ADDRESS'
    expect(page).to have_content 'SHIPPING ADDRESS'
  end

  context "chechout" do
    scenario "User fill addresses forms and continue" do
      visit addresses_path
      within '#addresses' do
        fill_in 'b_firstname', with: 'Vasiliy'
        fill_in 'b_lastname', with: 'Pupkin'
        fill_in 'b_street', with: 'st. Shevchenko 7'
        fill_in 'b_city', with: 'Dnipropetrovsk'
        within '#b_country_id_country_id' do
          find("option[value='#{@country.id}']").click
        end
        fill_in 'b_zipcode', with: '12356-9800'
        fill_in 'b_phone', with: '+380669632587'
        fill_in 's_firstname', with: 'Vasiliy'
        fill_in 's_lastname', with: 'Pupkin'
        fill_in 's_street', with: 'st. Shevchenko 7'
        fill_in 's_city', with: 'Dnipropetrovsk'
        within '#s_country_id_country_id' do
          find("option[value='#{@country.id}']").click
        end
        fill_in 's_zipcode', with: '12356-9800'
        fill_in 's_phone', with: '+380669632587'
        click_button 'SAVE AND CONTINUE'
      end
      expect(page).to have_content 'UPS 10.25'
    end

    scenario "User set credit card info and continue" do
      visit checkout_payment_path
      within '#new_credit_card' do
        fill_in 'credit_card[card_number]', with: '12365212022'
        within '#credit_card_expiration_month' do
          find("option[value='April']").click
        end
        within '#credit_card_expiration_year' do
          find("option[value='2014']").click
        end
        fill_in 'credit_card[code]', with: '1232'
        # fill_in 'credit_card[user_id]', with: "#{@user.id}"
        click_button 'SAVE AND CONTINUE'
      end
      expect(page).to have_content 'CONFIRM'
    end
  end
end