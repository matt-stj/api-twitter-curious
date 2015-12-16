class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      flash[:notice] = "You're now signed in."
    else
      flash[:alert] = "There was an error."
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting. You've been logged out."
    redirect_to root_path
  end

end
