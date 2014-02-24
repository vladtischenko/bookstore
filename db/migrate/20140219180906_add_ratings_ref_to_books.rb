class AddRatingsRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :ratings, index: true
  end
end
