class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: :home

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :phone_number, :street, :postcode, :city, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :phone_number, :street, :postcode, :city, :photo])
  end
end
