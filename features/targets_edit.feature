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
    
    Scenario Outline: Attribute presence validation
        When I update the target "my-target" without attribute "<attribute>"
        Then I should see target "<attribute>" cannot be blank

        Examples:
            | attribute          |
            | name               |
            | heroku_app_name    |
            | heroku_git_remote  |
            | git_remote         |
            | git_default_branch |
            | url                |

