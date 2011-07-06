require 'spec_helper'

describe LoginsController do

  describe "POST login" do
    it "should succeed for valid user" do
      api_post :login => 'John', :password => 'secret'
      controller.logged_user.should == "John"
      response.content_type.should == API_MIME
      response.status.should == 201 #Created
      response.location.should == account_url
      response.cookies['remember_token'].should_not be_blank
    end
    
    it "should fail for invalid user" do
      api_post :login => 'TheBadGuy', :password => 'mooohahaha'
      controller.should_not be_logged_in
      response.content_type.should == API_MIME
      response.status.should == 401 #Not authorized
      response.location.should == home_url
      response.cookies['remember_token'].should be_nil
    end
  end
  
  describe "DELETE login" do
    it "should remove cookie for authenticated user" do
      controller.force_user_in "John"
      api_delete
      controller.should_not be_logged_in
      response.content_type.should == API_MIME
      response.status.should == 205 #Reset content
      response.headers['Set-Cookie'].should =~ /^remember_token=;/
    end
  end
end
