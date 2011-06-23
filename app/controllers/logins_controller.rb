class LoginsController < ApplicationController
  
  respond_to :dsim
  
  def create
    respond_to do |format|
      format.dsim { head :status => :created, :location => home_url }
    end
  end

end
