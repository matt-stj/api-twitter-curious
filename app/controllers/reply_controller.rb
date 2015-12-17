class ReplyController < ApplicationController

  def create
    tweet = twitter_service.
    if twitter_service.update("@#{tweet.user.username}", in_reply_to_status_id: tweet.id)
      redirect_to users_path
    else
      flash[:alert] = f.error_messages
    end
  end

end
