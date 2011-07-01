require 'media_support'

module RequestExampleSupport
  
  include MediaSupport
   
  def api_get(url='/home')
    env = API_DEFAULT_ENV.dup
    get url, nil, env
  end
  
  def api_post(url, body)
    env = {'RAW_POST_DATA' => body.to_json}.reverse_merge! API_DEFAULT_ENV
    post url, nil, env
    api_get response.location if redirect? || response.status == 201
  end
  
end
