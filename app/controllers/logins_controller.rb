require 'media_support'

class LoginsController < ApplicationController
  
  include MediaSupport
  
  respond_to :dsim
  
  def create
    decode_media! request.raw_post
    login = document["login"]
    password = document["password"]
    valid_user = (login == "John" && password == "secret") 
    
    respond_to do |format|
      format.dsim {
        if valid_user
          head :status => :created, :location => account_url
        else
          head :status => :unauthorized, :location => home_url
        end
      }
    end
  end

end
