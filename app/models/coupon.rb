class Coupon < ActiveRecord::Base
  validates :code, :price, presence: true
  validates :price, numericality: true
  belongs_to :order
end
