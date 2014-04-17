class CreditCard < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :user
  validates :expiration_month, presence: true
  validates :user_id, :card_number, :code, :expiration_year,
            presence: true, numericality: true
  validates :code, length: {is: 3}
  validates :card_number, length: {is: 16}

  before_save :check_date

  def check_date
    @months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December']

    if self.expiration_year == Time.new.year
      if @months.index(expiration_month) + 1 >= Time.new.month
        true
      else
        false
      end
    else
      true
    end
  end
end
