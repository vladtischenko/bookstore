require 'features/features_spec_helper'

feature "User remove book from cart before completing an order" do
  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user

    @order = FactoryGirl.create :order, user_id: @user.id, state: 'in_progress'
    @book = FactoryGirl.create :book
    @order_items = FactoryGirl.create_list :order_item, 2, book_id: @book.id, order_id: @order.id
    @order.order_items = @order_items
    @user.stub(:current_order).and_return(@order)
  end

  scenario "User visit cart and remove one book form it" do
    visit user_orders_cart_path(@user)
    click_link "#{@order_items.first.id}_delete"
    expect(page).to have_content 'OrderItem was successfully destroyed'
  end

  scenario "User visit cart and remove all book from it" do
    visit user_orders_cart_path(@user)
    Order.stub(:empty_cart).and_return(@order_items.clear)
    click_link 'empty cart'
    expect(@order_items.count).to eq 0
  end
end