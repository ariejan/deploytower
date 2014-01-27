Feature:
    As a user
    I want to add new targets
    So I can deploy more

    Scenario: Add a target
        Given 0 targets exist
        When I add a new target named "awesome-qa"
        Then I should be on the target detail page for "awesome-qa"
