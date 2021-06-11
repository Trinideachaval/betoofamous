class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @celebrity = Celebrity.find(params[:celebrity_id])
  end


  def edit
    @reservation = Reservation.find(params[:id])
    @celebrity = Celebrity.find(params[:celebrity_id])
    @reservation.celebrity = @celebrity
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to profile_path
    else
      render :dashboard
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @celebrity = Celebrity.find(params[:celebrity_id])
    @reservation.status = "pending"
    @reservation.user = current_user
    @reservation.celebrity = @celebrity
      if @reservation.save
        redirect_to celebrity_reservation_path(@celebrity, @reservation)
      else
        render :new
      end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @review = Review.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_begin, :reserve_end, :status)
  end
end
