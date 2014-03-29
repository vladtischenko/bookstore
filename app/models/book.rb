require 'carrierwave/orm/activerecord'

class Book < ActiveRecord::Base
  # mount_uploader :picture, PictureUploader

  has_many :ratings, dependent: :destroy
  belongs_to :category
  belongs_to :author
  validates :title, :short_description, :description, :price, presence: true
  validates :price, numericality: true
  # validates :in_stock, inclusion: {in: ['in_progress', 'in_queue', 'in_delivery', 'delivered']}

  paginates_per 9

  scope :category, -> (category) { where(category_id: category.id) }

  def self.news_five
    order(created_at: :desc).limit(5).shuffle
  end
end
