class CategoriesController < ApplicationController
  def all_books
    @books = Book.where(category_id: params[:id])
  end
end
