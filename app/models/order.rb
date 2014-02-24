class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  validates :subtotal, numericality: true
  validates :state, presence: true
  validates :number, presence: true
  # validates :completed_at, presence: true

  before_save :set_subtotal

  def set_subtotal
    self.subtotal = 0
    self.order_items.each do |item|
      self.subtotal += item.price * item.quantity
    end
  end

  def empty_cart
    self.order_items.clear
    self.subtotal = 0
  end
end
