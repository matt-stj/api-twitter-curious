class TweetController < ApplicationController

  def new
  end

  def create
    twitter_service.update(params[:tweet][:message])
    redirect_to users_path
  end

  private

   def twitter_service
     TwitterService.new(current_user).client
   end

end
