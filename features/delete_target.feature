Feature:
    As a user
    I want to remove old targets
    So they are not available any longer

    Background:
        Given a target "my-target" exists

    Scenario: Destroy the target
        When I destroy the target "my-target"
        Then I should see the target "my-target" no longer exists
        And I see the target was deleted successfully
