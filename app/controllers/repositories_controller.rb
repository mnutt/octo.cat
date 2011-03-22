require 'repo'

class RepositoriesController < ApplicationController
  def show
    @repo = Repo.new(params[:user], params[:repo])
  end

  def watch
  end
end
