class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :card_number
      t.string :expiration_month
      t.integer :expiration_year
      t.integer :code
      t.references :user, index: true

      t.timestamps
    end
  end
end
