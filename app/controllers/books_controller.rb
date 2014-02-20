class BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(9)
    @categories = Category.all
    [@books, @categories]
  end

  def get_by_category
    @books = Book.where(category_id: params[:category_id]).
                  page(params[:page]).per(9)
    @category = Category.find(params[:category_id])
    @categories = Category.all
    [@books, @category, @categories]
    render 'categories/index'
  end

  def show
    @book = Book.find(params[:id])
  end

  def news
    @books = Book.news_five.page(params[:page]).per(1)
    render 'news'
  end

  private
    def book_params
      params.require(:book).permit(:title, :short_description, :description,
        :picture, :price, :in_stock)
    end
end
