class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Signed in!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to root_url
  end
end
