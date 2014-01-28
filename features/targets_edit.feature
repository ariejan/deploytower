Feature:
    As a user
    I want to edit targets
    So the targets are always up-to-date

    Background:
        Given a target "my-target" exists

    Scenario: Update target name
        When I update the name of "my-target" to "your-target"
        Then I should see "your-target" in the overview
        And I should see the target "my-target" no longer exists
    
    Scenario: Change name to blank
        When I update the name of "my-target" to ""
        Then I should see target name cannot be blank

