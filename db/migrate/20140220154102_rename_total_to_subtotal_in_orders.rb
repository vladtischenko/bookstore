class RenameTotalToSubtotalInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :total
    add_column :orders, :subtotal, :float
  end
end
