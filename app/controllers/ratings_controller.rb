class RatingsController < ApplicationController
  authorize_resource

  def new
    @book = Book.find(params[:book_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    
    if @rating.save
      redirect_to book_path(@rating.book),
        notice: t(:created, scope: [:success], obj: @rating.class.to_s)
    else
      redirect_to new_book_rating_path(@rating.book),
        notice: t(:created, scope: [:fail], obj: @rating.class.to_s)
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rate, :allow, :book_id)
    end
end
