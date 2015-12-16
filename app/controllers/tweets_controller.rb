class TweetsController < ApplicationController

  def new
  end

  def create
    @tweet = Tweet.create(params[:song])
    redirect_to song_path(@song.id)
  end

end
