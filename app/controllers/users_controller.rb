class UsersController < ApplicationController
  before_filter :signed_in_user, only [:edit, :update]
  before_filter :correct_user, only [:edit, :update]
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
    @link = current_user.links.build if signed_in?
  end
  
  private
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
    
    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_path) unless current_user?(@user)
    # end
end
