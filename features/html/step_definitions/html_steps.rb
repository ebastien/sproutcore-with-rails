
module CookieSupport
  def cookie_jar
    driver = Capybara.current_session.driver
    # FIXME: It only works for RackTest
    driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  end
end

World(CookieSupport)

Given /^I am on the home page$/ do
  visit '/home'
end

When /^I login as "([^"]*)" with password "([^"]*)"$/ do |login, password|
  fill_in 'login', :with => login
  fill_in 'password', :with => password
  click_button 'log_me_in'
end

Then /^I am authenticated$/ do
  cookie_jar['remember_token'].should be_true
end

Then /^I get my account$/ do
  page.should have_css '.account'
end

Then /^I am denied access$/ do
  page.should have_css '.welcome'
end

When /^I logout$/ do
  click_button 'log_me_out'
end

Then /^I am not authenticated$/ do
  page.should have_css '.welcome'
  rack_mock_session.cookie_jar['remember_token'].should be_blank
end

When /^I force access to my account$/ do
  visit '/account'
end
