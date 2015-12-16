class UsersController < ApplicationController

  def index
    # @user_data = TwitterServiceMock.new
    @user_data ||= twitter_service
    @tweets = twitter_service.home_timeline
    #tried pagination and needed to break out tweets
  end

  def create
    twitter_service.update(params[:message])
  end


end
