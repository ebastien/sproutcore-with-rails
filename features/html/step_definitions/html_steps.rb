Given "I am not logged in" do
  visit '/home'
end

When %q{I login as "$login" with password "$password"} do |login, password|
  fill_in 'login', :with => login
  fill_in 'password', :with => password
  click_button 'log_me_in'
end

Then "I get my account" do
  page.should have_css '.account'
end

Then "I don't get my account" do
  page.should_not have_css '.account'
end

When "I visit the home page" do
  visit '/home'
end

When "I logout" do
  click_button 'log_me_out'
end

Given "I am logged in" do
  Given "I am not logged in"
  When %q{I login as "John" with password "secret"}
  Then "I get my account"
end

Then "I am denied direct access to my account" do
  visit '/account'
  Then "I don't get my account"
end

Then "I am granted access to my account" do
  Then "I get my account"
end
