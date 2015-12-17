class UsersController < ApplicationController
  skip_before_filter :require_user

  def index
    @user_data ||= twitter_service
  end

end
