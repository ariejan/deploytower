Feature:
    As a user
    I want to edit targets
    So the targets are always up-to-date

    Background:
        Given a target "my-target" exists

    Scenario: Update target name
        When I update the target "my-target" to "your-target"
        Then I should see "your-target" in the overview
        And I should see the target "my-target" no longer exists
    
    Scenario: It reports validation errors
        When I update target "my-target" with invalid data
        Then I should see errors on target
