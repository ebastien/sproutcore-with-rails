require 'media_support'

class LoginsController < ApplicationController
  
  include MediaSupport
  
  respond_to :dsim
  
  def create
    decode_media! request.raw_post
    log_user_in document["login"], document["password"]
    respond_to do |format|
      format.dsim do
        if logged_in?
          head :status => :created, :location => account_url
        else
          head :status => :unauthorized, :location => home_url
        end
      end
    end
  end
  
  def destroy
    log_user_out
    respond_to do |format|
      format.dsim { head :reset_content }
    end
  end

end
