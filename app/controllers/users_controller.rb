class UsersController < ApplicationController

  def show
    binding.pry
    @user_data = TwitterService.new(current_user).client
  end


end
