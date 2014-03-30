class AddRefsToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :book, index: true
    add_reference :order_items, :order, index: true
  end
end
