class AddImagesToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :grey_img, :string
    add_column :ratings, :yellow_img, :string
  end
end
