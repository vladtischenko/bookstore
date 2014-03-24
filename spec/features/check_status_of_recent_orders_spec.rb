require 'features/features_spec_helper'

feature "User can check status of his recent orders" do

  background do
    @user = FactoryGirl.create :user
    login_as @user, scope: :user

    @book = FactoryGirl.create :book
  end

  feature "User click orders link" do
    feature "User has" do
      scenario "just order in_progress" do
        set_in_progress
        visit user_orders_path(@user)
        expect(page).to have_content 'IN PROGRESS'
        expect(page).not_to have_content 'Your shopping cart is empty!!!'
      end
      scenario "order waiting" do
        set_waiting
        visit user_orders_path(@user)
        expect(page).to have_content 'Your shopping cart is empty!!!'
        expect(page).to have_content 'WAITING'
      end
      scenario "order in_delivery" do
        set_in_delivery
        visit user_orders_path(@user)
        expect(page).to have_content 'Your shopping cart is empty!!!'
        expect(page).to have_content 'IN DELIVERY'
      end
      scenario "order delivered" do
        set_delivered
        visit user_orders_path(@user)
        expect(page).to have_content 'Your shopping cart is empty!!!'
        expect(page).to have_content 'DELIVERED'
      end
      scenario "orders with all states" do
        set_in_progress
        set_waiting
        set_in_delivery
        set_delivered
        visit user_orders_path(@user)
        expect(page).not_to have_content 'Your shopping cart is empty!!!'
        expect(page).to have_content 'IN PROGRESS'
        expect(page).to have_content 'WAITING'
        expect(page).to have_content 'IN DELIVERY'
        expect(page).to have_content 'DELIVERED'
      end
    end
  end

  def set_in_progress
    @order_in_progress = FactoryGirl.create :order, user_id: @user.id, state: 'in_progress'
    @in_progress_order_items = FactoryGirl.create_list :order_item, 5,
                                order: @order_in_progress, book: @book
    @order_in_progress.order_items = @in_progress_order_items
    @user.stub(:current_order).and_return(@order_in_progress)
  end

  def set_waiting
    @order_waiting = FactoryGirl.create :order, user_id: @user.id, state: 'waiting'
    @waiting_order_items = FactoryGirl.create_list :order_item, 5,
                                order: @order_waiting, book: @book
    @order_waiting.order_items = @waiting_order_items
  end

  def set_in_delivery
    @order_in_delivery = FactoryGirl.create :order, user_id: @user.id, state: 'in_delivery'
    @in_delivery_order_items = FactoryGirl.create_list :order_item, 5,
                                order: @order_in_delivery, book: @book
    @order_in_delivery.order_items = @in_delivery_order_items
  end

  def set_delivered
    @order_delivered = FactoryGirl.create :order, user_id: @user.id, state: 'delivered'
    @delivered_order_items = FactoryGirl.create_list :order_item, 5,
                              order: @order_delivered, book: @book
    @order_delivered.order_items = @delivered_order_items                          
  end
end