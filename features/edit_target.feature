Feature:
    As a user
    I want to edit targets
    So the targets are always up-to-date

    Background:
        Given a target "my-target" exists

    Scenario: Update target name
        When I update the target "my-target" to "your-target"
        Then I should be on the target page for "your-target"
        And I see the target was updated successfully
    
    Scenario: It reports validation errors
        When I update target "my-target" with invalid data
        Then I should see errors on target
