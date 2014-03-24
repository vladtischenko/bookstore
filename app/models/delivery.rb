class Delivery < ActiveRecord::Base
  validates :text, :price, presence: true
  validates :price, numericality: true

  belongs_to :order

  scope :by_price, -> {order(:price)}

  def to_s
    self.text + " " + self.price.to_s if text and price
  end
end
