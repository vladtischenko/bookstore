class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order
  validates :quantity, presence: true
  validates :price, presence: true
  validates :order_id, :book_id, presence: true
  # validates :total, presence: true

  before_save :set_total

  def set_total
    self.total = self.price * self.quantity
  end
end
