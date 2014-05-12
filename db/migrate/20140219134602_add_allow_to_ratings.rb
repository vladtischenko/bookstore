class AddAllowToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :allow, :boolean
  end
end
