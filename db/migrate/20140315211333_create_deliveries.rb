class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :text
      t.float :price

      t.timestamps
    end
  end
end
