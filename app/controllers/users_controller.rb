class UsersController < ApplicationController
  skip_before_filter :require_user

  def index
    @user_data ||= twitter_service
    @tweets = twitter_service.home_timeline
    #tried pagination and needed to break out tweets
  end

end
