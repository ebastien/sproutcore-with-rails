class HomeController < ApplicationController
  
  respond_to :html, :json
   
  def index
    @context = {
      :links => [
        { :rel => "self", :href => root_url },
        { :rel => "login", :href => root_url }
      ]
    }
    respond_with(@context)
  end

end
