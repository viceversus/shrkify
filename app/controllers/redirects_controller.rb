class RedirectsController < ApplicationController
  def create
    @link = Link.find_by_short_url(params[:short_url])
    @redirect = @link.redirects.create(:link_id => @link.id, :ip_address => request.remote_ip)
    redirect_to @link.url
  end
end
