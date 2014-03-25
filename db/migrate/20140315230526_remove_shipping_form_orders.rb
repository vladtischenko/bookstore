class RemoveShippingFormOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :shipping
  end
end
