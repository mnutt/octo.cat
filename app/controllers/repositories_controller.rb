require 'repo'

class RepositoriesController < ApplicationController
  def show
    response.headers['Cache-Control'] = 'public, max-age=120'
    @repo = Repo.new(params[:user], params[:repo])

    unless @repo.exists?
      flash[:error] = "Repository not found."
      redirect_to '/'
      return
    end
  end

  def watch
  end
end
