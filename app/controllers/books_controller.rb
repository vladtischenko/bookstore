class BooksController < ApplicationController
  def index
    init_in_progress_order
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
    init_in_progress_order
    @books = Kaminari.paginate_array(Book.news_five).page(params[:page]).per(1)
    render 'news'
  end

  private
    def book_params
      params.require(:book).permit(:title, :short_description, :description,
        :picture, :price, :in_stock)
    end

    def init_in_progress_order
      unless current_user.orders.where("user_id = ? AND state = ?",
            current_user, 'in_progress').first
        current_user.orders << Order.create(state: 'in_progress',
          number: "R#{Time.now.to_i}", subtotal: 0, order_total: 0, shipping: 0)
        current_user.save  
      end  
    end
end
