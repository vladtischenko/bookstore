class CategoriesController < ApplicationController
  def all_books
    @books = Book.category params[:id]
  end
end
