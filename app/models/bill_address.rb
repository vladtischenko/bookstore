class BillAddress < ActiveRecord::Base
  belongs_to :country
  validates :city, :street, :phone, :zipcode,
              :firstname, :lastname, presence: true
end
