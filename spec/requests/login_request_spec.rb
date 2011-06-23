require 'spec_helper'

describe "login request" do
  it "logs me in successfully" do
    api_get
    response.should be_success
    decode!

    login_link = link 'login'
    login_link.should be_true
    
    api_post login_link, { :login => 'John', :password => 'secret' }
    response.should be_success
    decode!
  end
end
