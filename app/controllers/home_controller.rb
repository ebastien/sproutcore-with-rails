class HomeController < ApplicationController
   
  def show
    @context = {
      :links => [
        { :rel => "self", :href => home_url },
        { :rel => "login", :href => login_url }
      ]
    }
    respond_to do |format|
      format.html
      format.dsim { render :json => @context }
    end
  end

end
