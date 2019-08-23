class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @rental = Rental.find(params[:rental_id])
    @cutie = @rental.cutie
    @user = @rental.user
  end

  def create
    @review = Review.new(review_params)
    @rental = Rental.find(params[:rental_id])
    @user = @rental.user
    @user_now = current_user
    @review.rental = @rental
    @review.user = @user
    if @review.save
      redirect_to dashboard_path(@user_now), notice: 'The review was send successfully.'
    else
      render :new, notice: 'Check your Review'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
