Feature:
    As a user
    I want to add new targets
    So I can deploy more

    Scenario: Add a target
        Given no targets exist
        When I add a new target named "awesome-qa"
        Then I should be on the target detail page for "awesome-qa"

    Scenario Outline: Attribute presence validation
        Given no targets exist
        When I add a new target without attribute "<attribute>"
        Then I should see target "<attribute>" cannot be blank

        Examples:
            | attribute          |
            | name               |
            | heroku_app_name    |
            | heroku_git_remote  |
            | git_remote         |
            | git_default_branch |
            | url                |


