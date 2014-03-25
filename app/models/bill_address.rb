class BillAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  validates :city, :street, :phone, :zipcode,
              :firstname, :lastname, :user_id, presence: true
end
