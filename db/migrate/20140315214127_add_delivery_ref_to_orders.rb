class AddDeliveryRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :delivery, index: true
  end
end
