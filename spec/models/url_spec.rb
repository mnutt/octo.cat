require 'spec_helper'

describe Url do
  describe "#set_short" do
    it "sets #short" do
      Url.count.should be_zero

      url = Url.new(:url => "http://google.com")
      url.set_short
      url.short.should == "1"
    end
  end
end
