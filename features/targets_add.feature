Feature:
    As a user
    I want to add new targets
    So I can deploy more

    Scenario: Add a target
        Given no targets exist
        When I add a new target named "awesome-qa"
        Then I should be on the target detail page for "awesome-qa"

    Scenario: It reports validation errors
        Given no targets exist
        When I try to add an invalid target
        Then I should see errors on target
