class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_node
    Node.find(params[:node_id])
  end
  
end
