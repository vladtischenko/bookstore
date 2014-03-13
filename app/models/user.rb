class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, :email, presence: true

  has_many :orders, dependent: :destroy
  has_one :bill_address, dependent: :destroy
  has_one :ship_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  after_create :current_order

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
                session["devise.facebook_data"]["extra"]["basic_info"] &&
                session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.firstname = data["first_name"] if user.firstname.blank?
        user.lastname = data["last_name"] if user.lastname.blank?
      end
    end
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.lastname = auth.info.last_name
      user.firstname = auth.info.first_name
      user.save!
    end
  end

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

  def current_bill_address
    bill_address = BillAddress.where(user_id: self).
                   first_or_create do |address|
      address.firstname = ""
      address.lastname = ""
      address.city = ""
      address.street = ""
      address.phone = ""
      address.zipcode = ""
    end
  end

  def current_ship_address
    ship_address = ShipAddress.where(user_id: self).
                   first_or_create do |address|
      address.firstname = ""
      address.lastname = ""
      address.city = ""
      address.street = ""
      address.phone = ""
      address.zipcode = ""
    end
  end
end
