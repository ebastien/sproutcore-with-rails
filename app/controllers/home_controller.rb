class HomeController < ApplicationController
   
  def show
    @context = {
      :links => [
        { :rel => "self", :href => home_url },
        { :rel => "login", :href => login_url }
      ]
    }
    if logged_in?
      @context[:links] << { :rel => "account", :href => account_url }
    end
    
    respond_to do |format|
      format.html do
        # Note: it looks somewhat contrived but the idea is to reuse the same
        # context when rendering all media types.
        account_link = @context[:links].find { |l| l[:rel] == "account" }
        if account_link
          head :status => :see_other, :location => account_link[:href]
        else
          render
        end
      end
      format.dsim do
        render :json => @context
      end
    end
  end

end
