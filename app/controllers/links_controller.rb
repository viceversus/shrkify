class LinksController < ApplicationController
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save 
      Link.sharken(@link)
      flash[:messages] = "Your sharkened url is #{root_url}shrk/#{@link.short_url}"
      redirect_to links_path
    else
      flash[:error] = "Please enter a valid link!"
      redirect_to root_path
    end
  end
  
  def show
    @link = Link.find_and_increment(params[:id])
    redirect_url = @link.url.match(/^http/) ? @link.url : "http://#{@link.url}"
    redirect_to redirect_url
  end
  
  def index
    @links = Link.all
  end
end