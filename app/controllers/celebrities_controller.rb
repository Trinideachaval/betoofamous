class CelebritiesController < ApplicationController
  def index
    if params[:query].present?
      @celebrities = policy_scope(Celebrity).search_name_and_description(params[:query])
    else
      @celebrities = Celebrity.all
    end
    
    @markers = @celebrities.geocoded.map do |celebrity|
      {
        lat: celebrity.latitude,
        lng: celebrity.longitude
      }
    end
    authorize @celebrities #TODO: check if this works, was added by danny.
  end

  def show
    @celebrity = Celebrity.find(params[:id])
    @reservations = @celebrity.reservations
    authorize @celebrity
  end

  def new
    @celebrity = Celebrity.new
    authorize @celebrity
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    if @celebrity.save
      redirect_to profile_path
    else
      render :new
    end
    authorize @celebrity
  end

  def edit
    @celebrity = Celebrity.find(params[:id])
    authorize @celebrity
  end

  def update
    @celebrity = Celebrity.find(params[:id])
    @celebrity.update(celebrity_params)
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new
    end
    authorize @celebrity
  end

  def destroy
    @celebrity = Celebrity.find(params[:id])
    @celebrity.destroy
    redirect_to profile_path
    authorize @celebrity
  end

  private

  def celebrity_params
    params.require(:celebrity).permit(:first_name, :last_name, :address, :description, :photo)
  end
end
