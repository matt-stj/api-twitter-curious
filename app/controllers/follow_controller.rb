class FollowController < ApplicationController

  def create
    twitter_service.unfollow(params[:format])
    redirect_to users_path
  end

end
