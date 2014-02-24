class AddBillAndShipRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :bill_address, index: true
    add_reference :users, :ship_address, index: true
  end
end
