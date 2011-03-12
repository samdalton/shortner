require 'spec_helper'
require 'mocha'

describe Link do
  
    before(:each) do
        @data = {
          :title => "Link title",
          :url => "http://www.google.com",
          :slug => "goog"
        }
    end
    
    it "should be invalid with a url" do
        Link.new(@data.except(:url)).should_not be_valid
    end

    it "should be invalid with a slug" do
        Link.new(@data.except(:slug)).should_not be_valid
    end

    it "should be vali with url and slug" do
        Link.new(@data).should be_valid
    end

    it "should increment click count with go " do
      link = Link.create(@data)
      link.go
      link.clicks.should == 1
    end
    
    it "should return the link url with go action" do
      Link.create(@data).go.should == @data[:url]
    end
  
end