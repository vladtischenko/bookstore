class RemoveColumnsFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :yellow_img
    remove_column :ratings, :grey_img
  end
end
