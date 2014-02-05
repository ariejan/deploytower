Feature: Queue deployments
    As a user
    I want to queue deployments
    So DeployTower can schedule the deployment soonest

    Background:
        Given a target exists

    Scenario: See previous deployments
        Given a deployment is already queued
        And I am on the target page
        Then I see a list of previous deployments

    Scenario: Queue a new deployment
        Given I am on the target page
        When I click the deploy button
        Then I should be on the target detail page
        And I should see a new deployment queued

    Scenario: Already queued deployment
        Given a deployment is already queued
        And I am on the target page
        Then I see the deploy button is disabled

    Scenario: Invalid queueing
        Given I am on the target page
        And a deployment is already queued
        When I click the deploy button
        Then I see an "deployment cannot be started" error message
