class RetypeCardNumberInCreditCards < ActiveRecord::Migration
  def change
    remove_column :credit_cards, :card_number
    add_column :credit_cards, :card_number, :decimal
  end
end
