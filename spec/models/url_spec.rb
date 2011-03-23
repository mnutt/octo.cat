require 'spec_helper'

describe Url do
  describe ".create_from_url" do
    it "creates a new url if none exists" do
      url = Url.create_from_url("http://google.com")
      url.should_not be_new_record
      url.url.should == "http://google.com"
    end

    it "returns existing url if one exists" do
      old = Url.create_from_url("http://google.com")
      url = Url.create_from_url("http://google.com")
      url.should_not be_new_record
      url.url.should == "http://google.com"
      url.id.should == old.id
    end
  end

  describe "#set_short" do
    before do
      Url.destroy_all
      Url.count.should be_zero
    end

    it "sets #short" do
      url = Url.new(:url => "http://google.com")
      url.set_short
      url.short.should == "1"
    end

    it "sets incremental #short" do
      old = Url.create(:url => "http://google.com")
      url = Url.new(:url => "http://github.com.com/mnutt/hummingbird")
      url.set_short
      url.short.should == "3"
    end
  end

  describe "#check_for_repo" do
    context "with a github repo" do
      it "returns true" do
        url = Url.new(:url => "http://github.com/mnutt/hummingbird")
        url.check_for_repo
        url.should be_is_repo
      end
    end

    context "without a github repo" do
      it "returns false" do
        url = Url.new(:url => "http://google.com/mnutt/hummingbird")
        url.check_for_repo
        url.should_not be_is_repo
      end
    end
  end
end
