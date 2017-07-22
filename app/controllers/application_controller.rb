class ApplicationController < ActionController::Base
  before_filter :set_locale
  
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end

  def user_not_authorized
    flash[:warning] = I18n.t 'user_not_authorized'
    redirect_to(request.referrer || root_path)
  end
end
