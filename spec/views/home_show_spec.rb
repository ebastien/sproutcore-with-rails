require "spec_helper"

describe "home/show.html.erb" do
  it "displays a login form" do
    render
    rendered.should have_selector(%Q(form input#login[type="text"]))
    rendered.should have_selector(%Q(form input#password[type="password"]))
    rendered.should have_selector(%Q(form input#log_me_in[type="submit"]))
  end
end
