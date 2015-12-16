class TweetsController < ApplicationController

  def new
  end

  def create
    twitter_service.update(params[:tweet][:message])
    redirect_to users_path
  end

end
