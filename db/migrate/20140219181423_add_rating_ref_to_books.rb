class AddRatingRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :rating, index: true
  end
end
