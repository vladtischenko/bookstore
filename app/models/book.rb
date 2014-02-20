class Book < ActiveRecord::Base
  has_many :ratings
  has_one :category
  belongs_to :author
  validates :title, :short_description, :description, :price, presence: true
  validates :price, numericality: true
  validates :in_stock, inclusion: {in: ['in_progress', 'in_queue', 'in_delivery', 'delivered']}

  paginates_per 9

  def self.news_five
    if count < 5
      return all
    end
    books = all.sort!{|x,y| x.create_at <=> y.create_at}
    result = []
    books[0..4].each{ |book| result << book }
  end
end
