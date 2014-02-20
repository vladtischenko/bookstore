class RatingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @rating = Rating.new
    [@rating, @book]
  end

  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rate)
    end
end
