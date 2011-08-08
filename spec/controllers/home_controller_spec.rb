require 'spec_helper'

describe HomeController do 
  describe "API" do
    describe "GET entry point" do
      it "answers with correct content type and contains the login link" do
        api_get
        response.content_type.should == API_MIME
        response.status.should == 200
        decode_media! response.body
        link('self').should be_true
        link('login').should be_true
      end
      
      it "includes a link to the account when logged in" do
        controller.force_user_in "John"
        api_get
        response.content_type.should == API_MIME
        response.status.should == 200
        decode_media! response.body
        link('account').should be_true
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
      
      it "redirects to the account when logged in" do
        controller.force_user_in "John"
        get :show
        response.status.should == 303 #See other
        response.location.should == account_url
      end
    end
  end
end
