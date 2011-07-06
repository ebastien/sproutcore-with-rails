require 'spec_helper'

describe AccountsController do
  describe "GET account" do
    it "should give back my account" do
      controller.force_user_in "John"
      api_get
      response.content_type.should == API_MIME
      response.status.should == 200 #OK
      decode_media! response.body
      document["account"].should be_true
    end
    
    it "should deny access on authentication failure" do
      api_get
      response.content_type.should == API_MIME
      response.status.should == 401 #Not authorized
    end
  end
end
