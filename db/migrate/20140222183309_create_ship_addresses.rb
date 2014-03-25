class CreateShipAddresses < ActiveRecord::Migration
  def change
    create_table :ship_addresses do |t|
      t.string :city
      t.string :street
      t.string :firstname
      t.string :lastname
      t.string :zipcode
      t.string :phone
      t.references :country, index: true

      t.timestamps
    end
  end
end
