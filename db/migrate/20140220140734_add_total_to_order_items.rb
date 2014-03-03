class AddTotalToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :total, :float
  end
end
