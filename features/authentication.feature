Feature: Authentication
  In order to grant access to known users only
  And to provide users with a persistent account
  I want to authenticate users
  
  Scenario: Login with valid credentials
    Given I am connected to the API
    When I login as "John" with password "secret"
    Then I get my account

  Scenario: Login with invalid credentials
    Given I am connected to the API
    When I login as "TheBadGuy" with password "mooohahaha"
    Then I am denied access