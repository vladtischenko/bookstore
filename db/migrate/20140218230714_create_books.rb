class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.string :picture
      t.string :in_stock
      t.float :price

      t.timestamps
    end
  end
end
