Feature:
    As a user
    I want to see a list of targets
    So I the current deploy situation is

    Scenario: With no targets
        Given 0 targets exist
        When I visit the target page
        Then I should see no targets configured

    Scenario: With targets
        Given 3 targets exist
        When I visit the target page
        Then I should see all targets

    Scenario: Targets are ordered alphabetically
        Given 2 randomly ordered targets exist
        When I visit the target page
        Then I see all targets are sorted alphabetically

    Scenario: Click through to target page
        Given 1 target exists
        When I visit the target page
        And I click on a target
        Then I should be on the target page
