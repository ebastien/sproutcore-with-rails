Feature: Authentication
  In order to grant access to known users only
  And to provide users with a persistent account
  I want to authenticate users
  
  Scenario: Login with valid credentials on the API
    Given I am connected to the API
    When I login as "John" with password "secret"
    Then I am authenticated
    And I get my account

  Scenario: Login with invalid credentials on the API
    Given I am connected to the API
    When I login as "TheBadGuy" with password "mooohahaha"
    Then I am denied access
  
  @wip
  Scenario: Logout from the API
    Given I am connected to the API
    When I login as "John" with password "secret"
    And I logout from the API
    Then I am not authenticated
