class AddOrderItemRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :order_item, index: true
  end
end
