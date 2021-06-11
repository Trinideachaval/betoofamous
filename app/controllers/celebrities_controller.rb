class CelebritiesController < ApplicationController

  def index
    if params[:query].present?
      @celebrities = Celebrity.search_name_and_description(params[:query])
    else
      @celebrities = Celebrity.all
      @markers = @celebrities.geocoded.map do |celebrity|
      {
        lat: celebrity.latitude,
        lng: celebrity.longitude
      }
      end
    end
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    if @celebrity.save
      redirect_to celebrities_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def celebrity_params
    params.require(:celebrity).permit(:first_name, :last_name, :address, :description, :photo_url)
  end

end
