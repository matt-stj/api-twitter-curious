class WelcomeController < ApplicationController

  def index
    @user_data = TwitterService.new(current_user)
  end

end
