class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  # validates :allow, inclusion: {in: [true, false]}
  validates :rate, :text, :title, :book_id, :user_id, presence: true
  validates :rate, numericality: true, inclusion: {in: 1..5}
end
