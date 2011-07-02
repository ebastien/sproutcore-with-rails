class AccountsController < ApplicationController
  
  respond_to :dsim
  
  def show
    @context = {
      :account => {}
    }
    respond_to do |format|
      format.dsim { render :json => @context }
    end
  end
end
