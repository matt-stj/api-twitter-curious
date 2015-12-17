class SessionsController < ApplicationController
  skip_before_filter :require_user

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    else
      flash[:alert] = "There was an error."
    end
    redirect_to users_path
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting. You've been logged out."
    redirect_to root_path
  end

end
