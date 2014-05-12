class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order
  validates :order_id, presence: true
  validates :book_id, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true,
            numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to:10}
  # validates :total, numericality: true

  before_save :set_total

  def set_total
    self.total = self.price * self.quantity
  end
end
