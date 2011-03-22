require 'spec_helper'

describe Repo do
  before do
    @repo = Repo.new("mnutt", "hummingbird")
  end

  describe "#remote_repo" do
    it "is a hash" do
      @repo.remote_repo.should be_a Hash
    end
  end

  describe "#repo_path" do
    it "combines user and repo" do
      @repo.repo_path.should == "mnutt/hummingbird"
    end
  end

  describe "#readme_path" do
    it "is the name of the readme file" do
      @repo.readme_path.should == "README.md"
    end
  end

  describe "#readme_sha" do
    it "is a sha" do
      @repo.readme_sha.should == "118ab6fdd1521123e178bcd883d06cde69b16e13"
    end
  end

  describe "#readme" do
    it "is the text of the readme" do
      @repo.readme.size.should == 3457
    end
  end

  describe "#rendered_readme" do
    it "is html safe" do
      @repo.rendered_readme.should be_html_safe
    end
  end
end
