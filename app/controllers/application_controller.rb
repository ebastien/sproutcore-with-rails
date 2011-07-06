class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from Exception, :with => :catch_internal_error
  
  include LoginsHelper
  
  private
  
  def catch_internal_error(exception)
    logger.error(exception)
    respond_to do |f|
      f.html { render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false }
      f.any { head :status => 500 }
    end
  end

  def catch_routing_error(exception)
    logger.error(exception)
    respond_to do |f|
      f.html { render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false }
      f.any { head :status => 404 }
    end
  end
end
