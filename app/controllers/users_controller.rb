class UsersController < ApplicationController

  def index
    # @user_data = TwitterServiceMock.new
    @user_data ||= twitter_service
    @tweets = twitter_service.home_timeline
  end

  # def show
  #   # @user_data = TwitterServiceMock.new
  #   @user_data ||= twitter_service
  #   @tweets = twitter_service.home_timeline
  # end

  def create
    twitter_service.update(params[:message])
  end

# private
#
#  def twitter_service
#    TwitterService.new(current_user).client
#  end

end
