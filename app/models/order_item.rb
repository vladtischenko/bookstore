class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order
  validates :order_id, presence: true
  validates :book_id, presence: true
  validates :quantity, :price, presence: true, numericality: true
  # validates :total, numericality: true

  before_save :set_total

  def set_total
    self.total = self.price * self.quantity
  end
end
