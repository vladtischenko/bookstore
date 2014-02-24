class RetypeStateInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :state
    add_column :orders, :state, :string
  end
end
