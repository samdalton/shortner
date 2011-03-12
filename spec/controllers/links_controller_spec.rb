require 'spec_helper'
require 'mocha'

describe LinksController do
    
    it "should load page with a list of all stored links" do
        link = Link.new
        Link.expects(:all).returns([link])
        get :index
        assigns[:links].should have(1).links
        response.should be_success
    end

    it "should create a new link when data submitted to create action" do
          Link.any_instance.stubs(:valid?).returns(true)
          post 'create'
          response.should redirect_to(links_path)
    end
    
    it "should flash an error message if the link can't be created" do
        Link.any_instance.stubs(:valid?).returns(false)
        post 'create'
        flash[:error].should_not be_nil 
    end

  
end