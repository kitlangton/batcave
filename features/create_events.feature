Feature: Administrators can create new events

  Scenario: User adds an event
    Given There are no events
    When I visit "events/new"
    And I fill in a date and a time
    And I add some bands
    And I click submit
    Then I should be redirected to "events"
    And the page should list my event
    And the page should list the bands


