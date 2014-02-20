class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  validates :allow, inclusion: {in: [true, false]}
  validates :rate, :text, :title, presence: true
  validates :rate, numericality: true
end
