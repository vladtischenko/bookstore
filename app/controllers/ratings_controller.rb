class RatingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @rating = Rating.new
    [@rating, @book]
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.save
    @book = Book.find(params[:rating][:book_id])
    @book.ratings << @rating
    @book.save

    redirect_to book_path(@book)
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rate, :allow)
    end
end
