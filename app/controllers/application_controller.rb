class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   rescue_from CanCan::AccessDenied do |exception|
   redirect_to root_url, :alert => "Você não tem essa permissão"
 end

 protect_from_forgery with: :exception
 before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me,:role,:pessoa_id)}
     
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :role, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role, :email, :password, :password_confirmation, :current_password) }
  end

end
