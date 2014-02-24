class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  validates :subtotal, numericality: true
  validates :state, presence: true
  validates :number, presence: true
  validates :shipping, numericality: true, presence: true
  # validates :completed_at
  # validates :order_total

  before_save :set_total

  scope :waiting, -> (user_id) {
    where("user_id = ? AND state = ?", user_id, 'waiting') }
  
  scope :in_delivery, -> (user_id) {
    where("user_id = ? AND state = ?", user_id, 'in_delivery') }
  
  scope :delivered, -> (user_id) {
    where("user_id = ? AND state = ?", user_id, 'delivered') }

  def set_total
    self.subtotal = 0
    self.order_items.each do |item|
      self.subtotal += item.price * item.quantity
    end
    self.shipping = 0 unless self.shipping
    self.order_total = self.subtotal + self.shipping
  end

  def empty_cart
    self.order_items.clear
    self.subtotal = 0
    self.order_total = 0
    self.shipping = 0
  end
end
