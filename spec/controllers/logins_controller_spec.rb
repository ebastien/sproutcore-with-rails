require 'spec_helper'

describe LoginsController do

  describe "POST login" do
    it "should succeed for valid user" do
      api_post :create, { :login => 'John', :password => 'secret' }
      response.content_type.should == API_MIME
      response.status.should == 201
      response.location.should == home_url
    end
    
    it "should fail for invalid user" do
      api_post :create, { :login => 'TheBadGuy', :password => 'mooohahaha' }
      response.content_type.should == API_MIME
      response.status.should == 401
      response.location.should == home_url
    end
  end
end
