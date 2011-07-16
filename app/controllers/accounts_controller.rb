class AccountsController < ApplicationController
  
  respond_to :dsim
  
  def show
    @context = { :account => {} }
    respond_to do |format|
      format.html
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
