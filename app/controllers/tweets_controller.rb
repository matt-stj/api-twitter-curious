class TweetsController < ApplicationController

  def index
    @tweets = Tweet.new(user).timeline

    Tweet.timeline

    # Why's this within the index method?

    def timeline
      TwitterService.new(current_user).user_timeline
    end

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
