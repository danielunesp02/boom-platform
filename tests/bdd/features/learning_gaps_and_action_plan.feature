Feature: Learning gaps and action plans

  The platform must detect learning gaps and create practical action plans
  based on evidence from student activity.

  Background:
    Given a student named "Helena" exists
    And the subject "Mathematics" exists
    And the topic "Fractions" exists
    And the skill "Identify equivalent fractions" exists

  Scenario: Repeated incorrect answers create a learning gap
    Given Helena has no open gap for skill "Identify equivalent fractions"
    When Helena completes an activity with repeated incorrect answers for that skill
    Then an open learning gap should exist for Helena and that skill
    And the learning gap should be linked to subject "Mathematics"
    And the learning gap should be linked to topic "Fractions"
    And the learning gap should have severity at least "MEDIUM"
    And the learning gap should record the first detected date
    And the learning gap should record the latest detected date

  Scenario: Repeated evidence updates the existing gap instead of creating a duplicate
    Given Helena has an open learning gap for skill "Identify equivalent fractions"
    When Helena completes another activity with incorrect answers for the same skill
    Then the existing learning gap should be updated
    And no duplicate open learning gap should be created for the same student and skill
    And the gap evidence count should increase
    And the gap latest detected date should be updated

  Scenario: Practice time is accumulated against an active gap
    Given Helena has an open learning gap for skill "Identify equivalent fractions"
    When Helena spends 15 minutes completing a practice activity for that skill
    And Helena spends 10 more minutes completing another practice activity for that skill
    Then the learning gap should show at least 25 minutes of total practice time

  Scenario: Action plan is created for a new high-priority gap
    Given Helena has no active action plan for skill "Identify equivalent fractions"
    When a high-priority learning gap is detected for that skill
    Then an active learning action plan should be created
    And the action plan should target skill "Identify equivalent fractions"
    And the action plan should contain at least one actionable item
    And each action plan item should have an expected duration

  Scenario: Existing active action plan is updated instead of duplicated
    Given Helena has an active action plan for skill "Identify equivalent fractions"
    When new evidence reinforces the same gap
    Then the existing action plan should be updated
    And no duplicate active action plan should be created for the same gap
    And the plan should remain linked to the learning gap
