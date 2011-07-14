Given /^I am on the home page$/ do
  visit '/home'
end

When /^I login as "([^"]*)" with password "([^"]*)"$/ do |login, password|
  fill_in 'login', :with => login
  fill_in 'password', :with => password
  click_button 'log_me_in'
end

Then /^I am authenticated$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I get my account$/ do
  pending # express the regexp above with the code you wish you had
end
