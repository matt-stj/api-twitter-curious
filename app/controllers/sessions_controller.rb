class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    render text: request.env["omniauth.auth"].inspect
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
