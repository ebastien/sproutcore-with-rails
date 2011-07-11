Feature: HTML authentication
  In order to grant access to known users only
  And to provide users with a persistent account
  I want to authenticate users
  
  @wip
  Scenario: Login with valid credentials
    Given I am on the home page
    When I login as "John" with password "secret"
    Then I am authenticated
    And I get my account