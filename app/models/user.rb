class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, presence: true

  has_many :orders, dependent: :destroy
  has_one :bill_address
  has_one :ship_address

  def to_s
    self.firstname + " " + self.lastname if firstname and lastname
  end

  def current_order
    order = self.orders.where("user_id = ? AND state = ?",
            self, 'in_progress').first_or_create do |order|
      order.state = 'in_progress'
      order.number = "R#{Time.now.to_i}"
      order.subtotal = 0
      order.order_total = 0
      order.shipping = 0
    end
    order.set_total
    order
  end
end
