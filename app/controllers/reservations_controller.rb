class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
      if @reservation.save!
        redirect_to celebrities_path
      else
        render :new
      end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservations = Reservation.all
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to profile_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_begin, :reserve_end, :status, :description)
  end
end
