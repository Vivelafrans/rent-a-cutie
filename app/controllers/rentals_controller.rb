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
    raise
      redirect_to cuty_path(@rental.cutie), notice: 'The request was send successfully.'
    else
      render :new, notice: 'Check your dates'
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(params.require(:rental).permit(:status))
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
