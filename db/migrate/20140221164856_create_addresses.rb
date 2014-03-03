class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :country, index: true
      t.string :city
      t.string :street
      t.string :zipcode
      t.string :phone

      t.timestamps
    end
  end
end
