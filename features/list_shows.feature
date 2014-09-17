Feature: Users can view upcoming shows

  Scenario: User views the shows index page
    Given There are 3 events with bands
    When I visit "events"
    Then the page should have content "Upcoming Shows"
    And the page should list all the events
    And the page should list all the bands for each event

