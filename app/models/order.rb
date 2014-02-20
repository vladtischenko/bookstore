class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  validates :subtotal, numericality: true
  validates :bill_address, :ship_address, presence: true
  validates :state, inclusion: { in: [true, false] }

  before_action :set_total

  def set_total
    self.order_items.each do |item|
      self.subtotal += item.price * item.quantity
    end    
  end

  def clear_card
    self.order_items = []
    self.subtotal = 0
  end
end
