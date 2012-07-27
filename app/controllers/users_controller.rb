class UsersController < ApplicationController
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
    @link = Link.new
    @links = @user.links
  end
end
