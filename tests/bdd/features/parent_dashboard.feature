Feature: Parent dashboard

  Parents and guardians should see a simple read-only dashboard
  based on the student's learning history and action plan.

  Background:
    Given a parent user named "Daniel" exists
    And a student named "Helena" exists
    And Daniel is linked as guardian of Helena
    And Helena has completed learning activities in the last 7 days
    And Helena has at least one active learning gap
    And Helena has one active action plan

  Scenario: Parent views dashboard for linked student
    When Daniel opens the parent dashboard for Helena
    Then the dashboard should show Helena's weekly activity summary
    And the dashboard should show activity history by day
    And the dashboard should show performance by subject
    And the dashboard should show active learning gaps
    And the dashboard should show the current action plan
    And the dashboard should not expose raw identity document values

  Scenario: Parent cannot view dashboard for unlinked student
    Given another student named "Unlinked Student" exists
    And Daniel is not linked as guardian of "Unlinked Student"
    When Daniel tries to open the dashboard for "Unlinked Student"
    Then the request should be denied
    And no dashboard data for "Unlinked Student" should be returned

  Scenario: Dashboard is read-only for parent role
    Given Daniel is viewing Helena's dashboard
    When Daniel tries to modify Helena's learning evidence from the dashboard
    Then the operation should be rejected
    And the learning evidence should remain unchanged

  Scenario: Dashboard returns a friendly empty state
    Given a student named "New Student" exists
    And Daniel is linked as guardian of "New Student"
    And New Student has no completed activities
    When Daniel opens the parent dashboard for New Student
    Then the dashboard should return an empty weekly summary
    And the dashboard should return no active gaps
    And the dashboard should return no current action plan
    And the response should include a friendly empty state message
