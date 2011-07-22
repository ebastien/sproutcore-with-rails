require "spec_helper"

describe "accounts/show.html.erb" do
  it "displays the account" do
    render
    rendered.should have_selector(%Q(.account))
  end
  
  it "has a logout button" do
    render
    rendered.should have_selector(%Q(form[action="/login"]))
    rendered.should have_selector(%Q(form input[name="_method"][value="delete"][type="hidden"]))
    rendered.should have_selector(%Q(form input#log_me_out[type="submit"]))
  end
end
