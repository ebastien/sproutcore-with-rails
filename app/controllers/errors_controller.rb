class ErrorsController < ApplicationController

  def routing
    exception = ActionController::RoutingError.new "No route matches [#{request.method}] \"/#{params[:path]}\""
    catch_routing_error(exception)
  end

end
