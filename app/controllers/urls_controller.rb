class UrlsController < ApplicationController
  layout 'home'

  def index
    response.headers['Cache-Control'] = 'public, max-age=60'
    @url = Url.new
  end

  def create
    @short_url = Url.create_from_url(params[:url])

    if @short_url.nil?
      flash[:error] = "There was a problem. (not a valid url perhaps?)"
      render 'index'
    end
  end

  def show
    @url = Url.where(:short => params[:short]).first

    if @url.nil?
      flash[:error] = "URL not found."
      redirect_to '/' and return
    end

    if request.headers['X_MOBILE_DEVICE']
      redirect_to @url.optimized_url
    else
      redirect_to @url.url
    end
  end

end
