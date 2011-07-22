require 'spec_helper'

describe AccountsController do
  describe "API" do
    describe "GET account" do
      it "should show my account" do
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
  
  describe "HTML" do
    describe "GET account" do
      it "should show my account" do
        controller.force_user_in "John"
        get :show
        response.content_type.should == Mime::HTML
        response.status.should == 200
        response.should render_template('show')
      end
      
      it "should deny access on authentication failure" do
        get :show
        response.content_type.should == Mime::HTML
        response.status.should == 303 #See other
        response.location.should == home_url
      end
    end
  end
end
