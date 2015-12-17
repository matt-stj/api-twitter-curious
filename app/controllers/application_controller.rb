class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_user
  helper_method :current_user, :twitter_service

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def twitter_service
    TwitterService.new(current_user).client
  end

  def require_user
    render file: 'public/404' unless current_user
  end

end
