require 'carrierwave/orm/activerecord'

class Book < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :ratings, dependent: :destroy
  belongs_to :category
  belongs_to :author
  validates :title, :short_description, :description, :price, presence: true
  validates :price, numericality: true
  # validates :in_stock, inclusion: {in: ['in_progress', 'in_queue', 'in_delivery', 'delivered']}

  paginates_per 9

  scope :category, -> (id) { where(category_id: id) }

  def self.news_five
    books = all.sort!{|x,y| x.created_at <=> y.created_at}.reverse
    if count < 5
      return books.to_a(self).shuffle
    end
    result = []
    books[0..4].each{ |book| result << book }
    result.shuffle
  end
end
