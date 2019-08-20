class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cutie = Cutie.find(params[:cuty_id])
  end

  def create
    @rental = Rental.new
    @user = current_user
    @cutie = Cutie.find(params[:cuty_id])
    @rental.cutie = @cutie
    @rental.user = @user
    if params[:rental][:end_date] > params[:rental][:start_date]
      @rental.save
      redirect_to cuty_path(@rental.cutie), notice: 'The request was send successfully.'
    else
      render :new, notice: 'Check your dates'
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
