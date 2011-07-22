Feature: HTML authentication
  In order to grant access to known users only
  And to provide users with a persistent account
  I want to authenticate users
  
  Scenario: Login with valid credentials
    Given I am on the home page
    When I login as "John" with password "secret"
    Then I get my account
    And I am authenticated
    
  Scenario: Login with invalid credentials
    Given I am on the home page
    When I login as "TheBadGuy" with password "mooohahaha"
    Then I am denied access
  
  Scenario: Logout
    Given I am on the home page
    When I login as "John" with password "secret"
    And I logout
    Then I am not authenticated

  Scenario: Account access without authentication
    Given I am on the home page
    When I force access to my account
    Then I am denied access
