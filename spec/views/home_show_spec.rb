require "spec_helper"

describe "home/show.html.erb" do
  it "displays a login form" do
    render
    rendered.should have_selector('form')
  end
end
