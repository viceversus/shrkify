class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def current_user?(user)
      user == current_user
    end
    helper_method :current_user?
end
