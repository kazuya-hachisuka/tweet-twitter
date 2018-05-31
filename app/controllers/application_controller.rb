class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  	def after_sign_in_path_for(resource)
  		tweets_path
  	end
  	def after_destroy_user_session_path(resource)
  		root_top_path
  	end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email])
  	devise_parameter_sanitizer.permit(:sign_in,keys: [:name])
  end
end
