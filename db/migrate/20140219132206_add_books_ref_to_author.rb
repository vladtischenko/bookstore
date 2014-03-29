class AddBooksRefToAuthor < ActiveRecord::Migration
  def change
    add_reference :authors, :book, index: true
    add_reference :books, :author, index: true
  end
end
