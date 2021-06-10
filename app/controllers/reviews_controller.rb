class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @reservation = Reservation.find(params[:reservation_id])
  end

  def create
    @review = Review.new(review_params)
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation = @reservation
    if @review.save!
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
