require 'spec_helper'

describe HomeController do 
  describe "API" do
    describe "GET entry point" do
      it "answers with correct content type and contains the login link" do
        api_get :show
        response.content_type.should == API_MIME
        response.status.should == 200
        decode_media! response.body
        link('login').should be_true
      end
    end
  end
end
