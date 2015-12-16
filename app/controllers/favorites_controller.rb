class FavoritesController < ApplicationController

  def index
    @favorites = twitter_service.favorites
  end

  def create
    twitter_service.favorite(params[:tweet_id])
    redirect_to favorites_path
  end

end
