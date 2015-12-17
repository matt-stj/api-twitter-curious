class WelcomeController < ApplicationController
  skip_before_filter :require_user

  def index
    @user_data ||= twitter_service if current_user
    @tweets = twitter_service.home_timeline if current_user
  end

  def create
    twitter_service.update(params[:message])
  end

end
