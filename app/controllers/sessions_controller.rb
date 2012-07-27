class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:messages] = "Signed in!"
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    flash[:messages] = "Signed out!"
    redirect_to root_url
  end
end