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

    Scenario: Click through to target detail page
        Given 1 target exists
        When I visit the target page
        And I click on a target
        Then I should be on the target detail page
