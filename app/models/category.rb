class Category < ActiveRecord::Base
  has_many :books, dependent: :destroy
  validates :title, presence: true, length: { in: 2..15 }
end
