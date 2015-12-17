class TweetsController < ApplicationController

  def index
    @tweets = twitter_service.user_timeline
  end

  def show
    @tweet = twitter_service.status(params[:id])
  end

  def new
  end

  def create
    if twitter_service.update(params[:tweet][:message])
      redirect_to users_path
    else
      flash[:alert] = f.error_messages
    end
  end

end
