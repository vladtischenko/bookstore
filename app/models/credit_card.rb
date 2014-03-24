class CreditCard < ActiveRecord::Base
  belongs_to :user
  validates :expiration_month, presence: true
  validates :user_id, :card_number, :code, :expiration_year,
            presence: true, numericality: true
  validates :code, length: {is: 4}
end
