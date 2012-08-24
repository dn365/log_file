class SiteController < ApplicationController
  def index
    @nodes = Node.all
    @uptime = %x["uptime"]
    
    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @line_items }
      format.json
    end
  end
  
  def uptime
     bag = system("rake databag")
     if bag
       flash[:notice] = "success"
       redirect_to site_url
     else
       flash[:notice] = "bad"
        redirect_to site_url
     end
  end
end
