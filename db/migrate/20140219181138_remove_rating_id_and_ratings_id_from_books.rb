class RemoveRatingIdAndRatingsIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :rating_id
    remove_column :books, :ratings_id
  end
end
