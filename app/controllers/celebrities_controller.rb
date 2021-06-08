class CelebritiesController < ApplicationController

  def index
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
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
    params.require(:celebrity).permit(:first_name, :last_name, :city, :description, :photo_url)
  end
end
