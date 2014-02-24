class AddBookRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :book, index: true
  end
end
