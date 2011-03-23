class UrlsController < ApplicationController
  layout 'home'

  def index
    response.headers['Cache-Control'] = 'public, max-age=60'
    @url = Url.new
  end

  def create
    if params[:url].blank?
      redirect_to '/'
      return
    end

    @short_url = Url.create_from_url(params[:url])

    if @short_url.nil?
      flash[:error] = "There was a problem. (not a valid url perhaps?)"
      render 'index'
    end
  end

  def show
    @url = Url.where(:short => params[:short]).first

    $redis.incr("short:all:#{@url.short}")

    if @url.nil?
      flash[:error] = "URL not found."
      redirect_to '/' and return
    end

    if request.headers['X_MOBILE_DEVICE']
      $redis.incr("short:mobile:#{@url.short}")

      redirect_to @url.optimized_url
    else
      redirect_to @url.url
    end
  end

end
