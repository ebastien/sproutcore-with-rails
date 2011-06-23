require './spec/support/media_support'

module ControllerExampleSupport

  include MediaSupport
  
  def api_get(action)
    @request.env.merge! API_DEFAULT_ENV
    get action
  end
  
  def api_post(action, body)
    @request.env.merge! API_DEFAULT_ENV
    @request.env['RAW_POST_DATA'] = body.to_json
    post action
  end
end
