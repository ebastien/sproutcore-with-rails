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
    api_get last_response.location if redirect? || last_response.status == 201
  end
  
  def api_delete(url)
    env = API_DEFAULT_ENV.dup
    delete url, nil, env
  end
end

World(APISupport)

Given /^I am connected to the API$/ do
  api_get
  last_response.should be_successful
  decode_media! last_response.body
end

When /^I login as "([^"]*)" with password "([^"]*)"$/ do |login, password|
  @login_link = link 'login'
  @login_link.should be_true
  api_post @login_link, { :login => login, :password => password }
end

Then /^I am authenticated$/ do
  last_response.should be_successful
  decode_media! last_response.body
  rack_mock_session.cookie_jar['remember_token'].should be_true
end

Then /^I get my account$/ do
  last_response.should be_successful
  decode_media! last_response.body
  document["account"].should be_true
end

Then /^I am denied access$/ do
  last_response.status.should ==  401
end

When /^I logout from the API$/ do
  @login_link = link 'login'
  @login_link.should be_true
  api_delete @login_link
end

Then /^I am not authenticated$/ do
  last_response.should be_successful
  rack_mock_session.cookie_jar['remember_token'].should be_blank
end

When /^I force access to my account$/ do
  api_get '/account'
end