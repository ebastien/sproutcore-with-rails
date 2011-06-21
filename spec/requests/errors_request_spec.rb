require 'spec_helper'

describe "error request" do
  it "responds with JSON on routing error" do
    get "/invalid/path", :format => 'json'
    response.response_code.should == 404
    response.content_type.should == 'application/json'
    response.body.should be_blank
  end
  
  it "responds with HTML on routing error" do
    get "/invalid/path"
    response.response_code.should == 404
    response.content_type.should == 'text/html'
    response.body.should_not be_blank
  end
end

