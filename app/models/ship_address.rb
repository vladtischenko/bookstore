class ShipAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  validates :city, :street, :phone, :zipcode,
              :firstname, :lastname, :user_id, presence: true

  def set_ship_as_bill(user)
    self.city = user.bill_address.city
    self.street = user.bill_address.street
    self.phone = user.bill_address.phone
    self.zipcode = user.bill_address.zipcode
    self.firstname = user.bill_address.firstname
    self.lastname = user.bill_address.lastname
    self.country_id = user.bill_address.country_id
    self
  end
end
