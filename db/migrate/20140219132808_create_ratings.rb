class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
