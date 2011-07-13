require 'spec_helper'

describe HomeController do 
  describe "API" do
    describe "GET entry point" do
      it "answers with correct content type and contains the login link" do
        api_get
        response.content_type.should == API_MIME
        response.status.should == 200
        # TODO: Maybe we should only check the behavior (i.e JSON rendering) and not the outcome
        decode_media! response.body
        link('login').should be_true
      end
    end
  end
  
  describe "HTML" do
    describe "GET home page" do
      it "answers with the correct template" do
        get :show
        response.content_type.should == Mime::HTML
        response.status.should == 200
        response.should render_template('show')
      end
    end
  end
end
