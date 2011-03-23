require 'repo'

class RepositoriesController < ApplicationController
  def show
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
