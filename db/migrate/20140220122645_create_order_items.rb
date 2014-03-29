class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.float :price
      t.integer :quantity
      # t.float :total

      t.timestamps
    end
    add_reference :order_items, :book, index: true
    add_reference :order_items, :order, index: true
  end
end
