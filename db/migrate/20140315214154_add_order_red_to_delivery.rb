class AddOrderRedToDelivery < ActiveRecord::Migration
  def change
    add_reference :deliveries, :order, index: true
  end
end
