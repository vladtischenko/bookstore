class RenameRatingColumnInRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :rating
    add_column :ratings, :rate, :integer
  end
end
