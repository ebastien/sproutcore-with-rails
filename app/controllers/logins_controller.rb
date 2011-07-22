require 'media_support'

class LoginsController < ApplicationController
  
  include MediaSupport
  
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  respond_to :dsim
  
  def create
    if Mime::Type.lookup(request.format) == Mime::DSIM
      decode_media! request.raw_post
      log_user_in document["login"], document["password"]
    else
      log_user_in params["login"], params["password"]
    end
    
    respond_to do |format|
    
      format.html do
        if logged_in?
          head :status => :see_other, :location => account_url
        else
          head :status => :see_other, :location => home_url
        end
      end
      
      format.dsim do
        if logged_in?
          head :status => :see_other, :location => account_url
        else
          head :status => :unauthorized, :location => home_url
        end
      end
      
    end
  end
  
  def destroy
    log_user_out
    respond_to do |format|
      format.html { head :status => :see_other, :location => home_url }
      format.dsim { head :reset_content }
    end
  end

end
