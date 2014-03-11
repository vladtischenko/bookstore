class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  validates :state, :number, presence: true
  validates :subtotal, numericality: true
  validates :shipping, presence: true, numericality: true 
  validates :order_total, numericality: true
  # validates :completed_at

  before_save :set_total

  scope :waiting, -> { where(state: 'waiting') }
  scope :in_delivery, -> { where(state: 'in_delivery') }
  scope :delivered, -> { where(state: 'delivered') }
  scope :by_user, -> (user) { where(user_id: user.id)  }

  def to_set
    {state: self.state, user_id: self.user_id, number: self.number,
      subtotal: self.subtotal, order_total: self.order_total, shipping: self.shipping}
  end

  def set_total(shipping = nil)
    self.subtotal = 0
    self.order_items.each do |item|
      self.subtotal += item.price * item.quantity
    end
    self.shipping = shipping if shipping
    self.order_total = self.subtotal + self.shipping
    self
  end

  def set_state
    self.state = 'waiting'
    self.completed_at = 'admin is checking you order'
    self.save
  end

  def empty_cart
    self.order_items.clear
    self.subtotal = 0
    self.order_total = 0
    self.shipping = 0
  end
end
