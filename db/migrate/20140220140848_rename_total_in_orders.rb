class RenameTotalInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :total
    add_column :orders, :total, :float 
  end
end
