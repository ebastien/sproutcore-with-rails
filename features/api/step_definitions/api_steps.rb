require 'media_support'

module APISupport
  
  include MediaSupport
   
  def api_get(url='/home')
    env = API_DEFAULT_ENV.dup
    get url, nil, env
  end
  
  def api_post(url, body)
    env = {'RAW_POST_DATA' => body.to_json}.reverse_merge! API_DEFAULT_ENV
    post url, nil, env
    api_get last_response.location if [201, 303].include? last_response.status
  end
  
  def api_delete(url)
    env = API_DEFAULT_ENV.dup
    delete url, nil, env
  end
end

World(APISupport)

Given "I am not logged in" do
  api_get
  last_response.should be_successful
  decode_media! last_response.body
end

When %q{I login as "$login" with password "$password"} do |login, password|
  @login_link = link 'login'
  @login_link.should be_true
  api_post @login_link, { :login => login, :password => password }
end

Then "I get my account" do
  last_response.should be_successful
  decode_media! last_response.body
  document["account"].should be_true
end

Then "I don't get my account" do
  last_response.status.should ==  401
end

When "I visit my account" do
  api_get '/account'
end

When "I visit the home page" do
  api_get
  last_response.should be_successful
  decode_media! last_response.body
end

When "I logout" do
  @login_link = link 'login'
  @login_link.should be_true
  api_delete @login_link
end

Given "I am logged in" do
  Given "I am not logged in"
  When %q{I login as "John" with password "secret"}
  Then "I get my account"
end

Then "I am denied access to my account" do
  When "I visit my account"
  Then "I don't get my account"
end

Then "I am granted access to my account" do
  When "I visit my account"
  Then "I get my account"
end
