class LinksController < ApplicationController
    
    before_filter :authenticate, :only => [:create, :index]
    
    def index
        @links = Link.all
    end
    
    def create
        link = Link.new(params[:link])
        if link.save
            redirect_to links_path
        else
           flash[:error] = 'Invalid link data entered' 
           redirect_to :action => :index
        end    
    end
    
    def go
        link = Link.find_by_slug(params[:slug])
        redirect_to link.go
    end
    
    def public
        redirect_to Link.find_by_slug("default").go
    end
    

   def authenticate
     authenticate_or_request_with_http_basic('Administration') do |username, password|
       @creds = YAML::load(File.open("#{Rails.root}/config/credentials.yml"))
       username == @creds['username'] && password == @creds['password']
     end
   end
    
end