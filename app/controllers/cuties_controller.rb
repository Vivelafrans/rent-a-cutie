class CutiesController < ApplicationController
  before_action :find_cutie, only: [:show, :edit, :update, :destroy]

  def index
    @cuties = Cutie.all
  end

  def show
  end

  def new
    # @user is needed for our form
    @user = current_user
    @cutie = Cutie.new
  end

  def create
    @cutie = Cutie.new(cutie_params)
    @user = current_user
    @cutie.user = @user
    save_cutie(@cutie)
  end

  def edit
  end

  def update
    @cutie.update(cutie_params)
    redirect_to cuty_path(@cutie)
  end

  def destroy
  end

  private

  # To allow user input from Cutie Create Form to be whitelisted
  def cutie_params
    params.require(:cutie).permit(:ad_title, :name, :animal_type, :age, :gender, :hourly_price, :description, :photo)
  end

  # To save Cuties to our database
  def save_cutie(cutie)
    if cutie.save
      redirect_to cuty_path(cutie)
    else
      render :new
    end
  end

  def find_cutie
    @cutie = Cutie.find(params[:id])
  end
end
