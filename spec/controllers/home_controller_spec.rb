require 'spec_helper'

describe HomeController do 
  describe "API" do
    describe "GET entry point" do
      it "answers with correct content type" do
        api_get :show
        response.content_type.should == API_MIME
      end

      it "contains the login link" do
        api_get :show
        decode!
        link('login').should be_true
      end
    end
  end
end
