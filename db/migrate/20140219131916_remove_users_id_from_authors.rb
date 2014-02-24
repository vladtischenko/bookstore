class RemoveUsersIdFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :users_id
  end
end
