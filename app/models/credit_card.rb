class CreditCard < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :card_number, :code, :expiration_year,
            :expiration_month, presence: true
end
