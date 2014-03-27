class ChangeCreditCards < ActiveRecord::Migration
  def change
    remove_column :credit_cards, :code
    remove_column :credit_cards, :card_number
    add_column :credit_cards, :code, :string
    add_column :credit_cards, :card_number, :string
  end
end
