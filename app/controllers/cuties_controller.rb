class CutiesController < ApplicationController
  def index
    @cuties = Cutie.all
  end

  def show
    @cutie = Cutie.find(params[:id])
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

  def update
  end

  def edit
  end

  def destroy
  end

  private

  # To allow user input from Cutie Create Form to be whitelisted
  def cutie_params
    params.require(:cutie).permit(:ad_title, :name, :animal_type, :age, :gender, :hourly_price, :description)
  end

  # To save Cuties to our database
  def save_cutie(cutie)
    if cutie.save
      redirect_to cuty_path(cutie)
    else
      render :new
    end
  end
end
