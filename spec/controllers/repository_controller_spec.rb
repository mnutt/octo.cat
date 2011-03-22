require 'spec_helper'

describe RepositoryController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'watch'" do
    it "should be successful" do
      get 'watch'
      response.should be_success
    end
  end

end
