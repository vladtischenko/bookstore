class AddBooksRefToAuthors < ActiveRecord::Migration
  def change
    add_reference :authors, :books, index: true
  end
end
