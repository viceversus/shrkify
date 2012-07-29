class LinksController < ApplicationController
  before_filter :find_link, :only => [:show, :edit, :update]
  before_filter :validate_user!, :only => [:edit, :update]
  
  def new
    @link = Link.new
  end
  
  def create
    if current_user
      @link = current_user.links.build(params[:link])
    else
      @link = Link.new(params[:link])
    end
    if @link.save 
      respond_to do |format|
        format.html { redirect_to @link.user || root_path, :success => "Your sharkened url is #{root_url}#{@link.short_url}" }
        format.js
      end
    else
      flash.now[:error] = "Please enter a valid link!"
      render 'new'
    end

  end
  
  def show
  end
  
  def index
    @links = Link.all
  end
  
  def edit
  end
  
  def update
    if @link.update_attributes(params[:link])
      flash[:messages] = "Link updated successfully!"
      redirect_to current_user || links_path
    else
      flash.now[:error] = "Update unsucessful!"
      render 'edit'
    end
  end
  
  private
    def find_link
      @link = Link.find(params[:id])
    end
    
    def validate_user!
      redirect_to root_path unless current_user?(@link.user)
    end
end