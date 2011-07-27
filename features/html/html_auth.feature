Feature: HTML authentication
  In order to grant access to known users only
  And to provide users with a persistent account
  I want to authenticate users
  
  Scenario: Login with valid credentials
    Given I am not logged in
    When I login as "John" with password "secret"
    Then I get my account
    
  Scenario: Login with invalid credentials
    Given I am not logged in
    When I login as "TheBadGuy" with password "mooohahaha"
    Then I don't get my account
  
  Scenario: Logout
    Given I am logged in
    When I logout
    Then I am denied access to my account

  Scenario: Account access without authentication
    Given I am not logged in
    When I visit my account
    Then I don't get my account

  Scenario: Persistent authentication
    Given I am logged in
    When I visit the home page
    Then I am granted access to my account
