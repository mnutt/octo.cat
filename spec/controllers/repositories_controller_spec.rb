require 'spec_helper'

describe RepositoriesController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :user => "mnutt", :repo => "hummingbird"
      response.should be_success
    end
  end

  describe "GET 'watch'" do
    it "should be successful" do
      get 'watch', :user => "mnutt", :repo => "hummingbird"
      response.should be_success
    end
  end

end
