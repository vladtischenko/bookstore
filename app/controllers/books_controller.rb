class BooksController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    # @books = Kaminari.paginate_array(Book.all.shuffle).page(params[:page]).per(9)
    @books = Book.all.page(params[:page]).per(9)
    @categories = Category.all
  end

  def get_by_category
    @category = Category.find(params[:category_id])
    @books = Book.category(@category).page(params[:page]).per(9)
    @categories = Category.all
    render 'categories/index'
  end

  def show
    @book = Book.find(params[:id])
  end

  def news
    @books = Kaminari.paginate_array(Book.news_five).page(params[:page]).per(1)
  end

  private
    def book_params
      params.require(:book).permit(:title, :short_description, :description,
        :picture, :price, :in_stock)
    end
end
