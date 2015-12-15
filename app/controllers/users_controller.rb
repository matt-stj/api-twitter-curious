class UsersController < ApplicationController

  def show
    # @user_data = TwitterServiceMock.new
    @user_data ||= TwitterService.new(current_user).client
  end


end
