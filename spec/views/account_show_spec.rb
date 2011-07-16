require "spec_helper"

describe "accounts/show.html.erb" do
  it "displays the account" do
    render
    rendered.should have_selector(%Q(.account))
  end
end
