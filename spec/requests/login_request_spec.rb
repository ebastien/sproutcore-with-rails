require 'spec_helper'

module MediaHelpers
  
  attr_accessor :document
  
  def decode!
    self.document = JSON.parse(response.body)
  end
  
  def link(rel)
    lnk = JsonPath.on(document, '$..links').flatten.select { |l| l['rel'] == rel }.first
    lnk && lnk['href']
  end
  
end

describe "login request" do
  
  include MediaHelpers
  
  it "logs me in successfully" do
    get '/', :format => 'json'
    response.should be_success
    decode!
    login_link = link 'login'
    login_link.should be_true
    get login_link, :format => 'json'
    response.should be_success
    decode!
  end
end
