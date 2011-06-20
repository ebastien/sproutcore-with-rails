require 'spec_helper'

describe HomeController do
  describe "GET index" do
    it "answer with JSON" do
      get :index, :format => 'json'
      response.content_type.should == Mime::JSON
    end

    it "contains the login link" do
      get :index, :format => 'json'
      doc = JSON.parse(response.body)
      JsonPath.on(doc, '$..links').flatten.select { |l| l["rel"] == "login" }.should_not be_empty
    end
  end
end
