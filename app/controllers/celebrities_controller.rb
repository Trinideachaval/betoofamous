class CelebritiesController < ApplicationController

  def index
    @celebrities = Celebrity.all
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
      redirect_to celebrity_path(@celebrity)
    else
      render :new
    end
  end

  def edit
    @celebrity = Celebrity.find(params[:id])
  end

  def update
    @celebrity = Celebrity.find(params[:id])
    @celebrity.update(celebrity_params)
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new
    end
  end

  def destroy
    @celebrity = Celebrity.find(params[:id])
    @celebrity.destroy
    redirect_to profile_path
  end

  private

  def celebrity_params
    params.require(:celebrity).permit(:first_name, :last_name, :city, :description, :photo_url)
  end
end
