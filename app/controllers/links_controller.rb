class LinksController < ApplicationController
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save 
      flash[:messages] = "Your sharkened url is #{root_url}#{@link.short_url}"
      redirect_to root_path
    else
      flash.now[:error] = "Please enter a valid link!"
      render 'new'
    end
  end
  
  def show
    @link = Link.find_and_increment(params[:id])
    redirect_to @link.url
  end
  
  def index
    @links = Link.all
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:messages] = "Link updated successfully!"
      redirect_to links_path
    else
      flash.now[:error] = "Update unsucessful!"
      render 'edit'
    end
  end
end