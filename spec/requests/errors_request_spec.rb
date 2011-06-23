require 'spec_helper'

describe "error request" do
  it "responds with correct code and content type on API routing error" do
    api_get '/invalid/path'
    response.status.should == 404
    response.content_type.should == API_MIME
    response.body.should be_blank
  end
  
  it "responds with correct code and HTML on routing error" do
    get '/invalid/path'
    response.status.should == 404
    response.content_type.should == Mime::HTML
    response.body.should_not be_blank
  end
end
