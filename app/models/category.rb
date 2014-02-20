class Category < ActiveRecord::Base
  has_many :books
  validates :title, presence: true, length: { in: 2..15 }
end
