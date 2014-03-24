class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_one :delivery
  belongs_to :user
  validates :state, :number, presence: true
  validates :subtotal, numericality: true
  validates :order_total, numericality: true
  # validates :completed_at

  before_save :set_total

  scope :waiting, -> { where(state: 'waiting') }
  scope :in_delivery, -> { where(state: 'in_delivery') }
  scope :delivered, -> { where(state: 'delivered') }
  scope :in_progress, -> { where(state: 'in_progress') }
  scope :by_user, -> (user) { where(user_id: user.id)  }

  def to_set
    {state: self.state, user_id: self.user_id, number: self.number,
      subtotal: self.subtotal, order_total: self.order_total, delivery_id: self.delivery_id}
  end

  def set_total
    self.subtotal = 0
    self.order_items.each do |item|
      self.subtotal += item.price * item.quantity
    end
    self.order_total = self.subtotal 
    self.order_total += self.delivery.price if self.delivery
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
    # self.shipping = 0
    self.delivery = nil
  end
end
