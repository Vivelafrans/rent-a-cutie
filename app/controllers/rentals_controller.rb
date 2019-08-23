class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cutie = Cutie.find(params[:cuty_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @user = current_user
    @cutie = Cutie.find(params[:cuty_id])
    @rental.cutie = @cutie
    @rental.user = @user
    if @rental.save
      redirect_to dashboard_path(@user), notice: 'The request was send successfully.'
    else
      render :new, notice: 'Check your dates'
    end
  end

  def edit
    @cutie = Cutie.find(params[:cuty_id])
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(params.require(:rental).permit(:status))
    redirect_to dashboard_path, notice: 'The request was send successfully.'
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
