class HomeController < ApplicationController
  
  respond_to :html, :json
   
  def index
    @context = { :link => { :rel => "self", :href => root_url } }
    respond_with(@context)
  end

end
