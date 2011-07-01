require 'spec_helper'

describe "login request" do
  before(:each) do
    api_get
    response.should be_success
    decode_media! response.body
    @login_link = link 'login'
    @login_link.should be_true
  end
  
  it "logs me in successfully" do
    api_post @login_link, { :login => 'John', :password => 'secret' }
    response.should be_success
    decode_media! response.body
  end
  
  it "denies login on wrong credentials" do
    api_post @login_link, { :login => 'TheBadGuy', :password => 'mooohahaha' }
    response.status.should ==  401
  end
end
