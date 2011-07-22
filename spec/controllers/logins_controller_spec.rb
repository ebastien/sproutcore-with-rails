require 'spec_helper'

describe LoginsController do
  describe "API" do
    describe "POST login" do
      it "should succeed for valid user" do
        api_post :login => 'John', :password => 'secret'
        response.content_type.should == API_MIME
        response.status.should == 303 #See other
        response.location.should == account_url
        response.cookies['remember_token'].should_not be_blank
        controller.logged_user.should == "John"
      end
      
      it "should fail for invalid user" do
        api_post :login => 'TheBadGuy', :password => 'mooohahaha'
        response.content_type.should == API_MIME
        response.status.should == 401 #Not authorized
        response.location.should == home_url
        response.cookies['remember_token'].should be_nil
        controller.should_not be_logged_in
      end
    end
    
    describe "DELETE login" do
      it "should remove cookie for authenticated user" do
        controller.force_user_in "John"
        api_delete
        response.content_type.should == API_MIME
        response.status.should == 205 #Reset content
        response.headers['Set-Cookie'].should =~ /^remember_token=;/
        controller.should_not be_logged_in
      end
    end
  end
  
  describe "HTML" do
    describe "POST login" do
      it "should succeed for valid user" do
        post :create, :login => 'John', :password => 'secret'
        response.status.should == 303 #See other
        response.location.should == account_url
        response.cookies['remember_token'].should_not be_blank
        controller.logged_user.should == "John"
      end
      
      it "should fail for invalid user" do
        post :create, :login => 'TheBadGuy', :password => 'mooohahaha'
        response.status.should == 303 #See other
        response.location.should == home_url
        response.cookies['remember_token'].should be_nil
        controller.should_not be_logged_in
      end
    end
    
    describe "DELETE login" do
      it "should remove cookie for authenticated user" do
        controller.force_user_in "John"
        post :destroy
        response.status.should == 303 #See other
        response.headers['Set-Cookie'].should =~ /^remember_token=;/
        controller.should_not be_logged_in
      end
    end
  end
end
