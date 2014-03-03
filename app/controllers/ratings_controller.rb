class RatingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.save

    redirect_to book_path(@rating.book)
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rate, :allow, :book_id)
    end
end
