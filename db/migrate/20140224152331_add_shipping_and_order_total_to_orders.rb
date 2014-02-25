class AddShippingAndOrderTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping, :float
    add_column :orders, :order_total, :float
  end
end
