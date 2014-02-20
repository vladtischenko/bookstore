class Author < ActiveRecord::Base
  has_many :books
  validates :firstname, :lastname, presence: true, length: { in: 2..20 }

  def to_s
    self.firstname + " " + self.lastname
  end
end
