require 'spec_helper'

describe LoginsController do

  describe "POST login" do
    it "should be successful" do
      api_post :create, { :login => 'John', :password => 'secret' }
      response.content_type.should == API_MIME
      response.status.should == 201
      response.location.should == home_url
    end
  end

end
