class LinksController < ApplicationController
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      Link.sharken(@link)
      redirect_to link_path(@link)
    else
      flash.now[:error] = "Invalid Link"
      render root_path
    end
  end
  
  def show
    @link = Link.find(params[:id])
    url = "http://" + @link.url unless @link.url.match(/^http/)
    redirect_to (url || @link.url)
  end
end
