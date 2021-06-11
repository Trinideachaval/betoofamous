class DashboardsController < ApplicationController

def profile
@reservations = Reservation.all
end

end
