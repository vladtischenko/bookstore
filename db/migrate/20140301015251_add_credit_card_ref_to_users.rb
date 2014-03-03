class AddCreditCardRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :credit_card, index: true
  end
end
