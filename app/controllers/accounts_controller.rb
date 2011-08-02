class AccountsController < ApplicationController
  
  respond_to :dsim
  
  def show
    @context = {
      :account => {},
      :links => [
        { :rel => "self", :href => account_url },
        { :rel => "login", :href => login_url }
      ]
    }
    respond_to do |format|
      format.html do
        if logged_in?
          render
        else
          head :see_other, :location => home_url
        end
      end
      
      format.dsim do
        if logged_in?
          render :json => @context
        else
          head :unauthorized
        end
      end
    end
  end
end
