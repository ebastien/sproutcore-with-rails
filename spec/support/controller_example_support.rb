require 'media_support'

module ControllerExampleSupport

  include MediaSupport
  
  def api_get
    @request.env.merge! API_DEFAULT_ENV
    get :show
  end
  
  def api_post(body)
    @request.env.merge! API_DEFAULT_ENV
    @request.env['RAW_POST_DATA'] = body.to_json
    post :create
  end
  
  def api_delete
    @request.env.merge! API_DEFAULT_ENV
    get :destroy
  end
end
