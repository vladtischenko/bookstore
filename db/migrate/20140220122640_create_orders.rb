class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      # t.string :number
      t.string :state
      # t.float :subtotal
      # t.float :order_total
      # t.datetime :completed_at

      t.timestamps
    end
    add_reference :orders, :user, index: true
  end
end
