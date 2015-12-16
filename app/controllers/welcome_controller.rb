class WelcomeController < ApplicationController

  def index
    # @user_data = TwitterServiceMock.new
    @user_data ||= twitter_service if current_user
    @tweets = twitter_service.home_timeline if current_user
  end

  def create
    twitter_service.update(params[:message])
  end

private

 def twitter_service
   TwitterService.new(current_user).client
 end


end
