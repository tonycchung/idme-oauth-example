class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    @payload = request.env["omniauth.auth"].extra.raw.to_hash
    session[:user_id] = user.id
    flash[:notice] = "Signed in successfully! This is your JSON response payload: #{@payload}"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session[:return_to] ||= request.referer
    flash[:notice] = "Signed out!"
    redirect_to session.delete(:return_to)
  end
end
