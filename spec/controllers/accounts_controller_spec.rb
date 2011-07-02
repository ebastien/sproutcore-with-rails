require 'spec_helper'

describe AccountsController do
  describe "GET account" do
    it "should give back my account" do
      api_get :show
      response.content_type.should == API_MIME
      response.status.should == 200
      decode_media! response.body
      document["account"].should be_true
    end
  end
end
