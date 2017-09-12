class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_locale
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options(_options = {})
    { locale: I18n.locale }
  end

  def authenticate_admin!
    if current_user && current_user.admin
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized
    flash[:warning] = I18n.t 'user_not_authorized'
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password avatar])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys:
                                      %i[email password current_password avatar])
  end
end
