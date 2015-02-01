class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Signed in!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session[:return_to] ||= request.referer
    flash[:notice] = "Signed out!"
    redirect_to session.delete(:return_to)
  end
end
