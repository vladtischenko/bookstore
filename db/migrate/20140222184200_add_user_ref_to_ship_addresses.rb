class AddUserRefToShipAddresses < ActiveRecord::Migration
  def change
    add_reference :ship_addresses, :user, index: true
  end
end
