Feature: Learning history preservation

  The platform must preserve detailed historical evidence for each student activity
  so that learning evolution can be measured over time.

  Background:
    Given a student named "Helena" exists
    And the subject "Mathematics" exists
    And the topic "Fractions" exists
    And the skill "Identify equivalent fractions" exists
    And a learning activity "Fractions practice" exists for "Helena"
    And the activity contains 3 multiple choice questions linked to the same skill

  Scenario: Completing an activity creates attempt, answers, evidence and summary
    When Helena starts the activity "Fractions practice"
    And Helena answers 2 questions correctly and 1 question incorrectly
    And Helena completes the activity
    Then one completed assessment attempt should exist for Helena and the activity
    And 3 answer submissions should exist for the attempt
    And 3 learning evidence records should exist for the answers
    And each learning evidence record should be linked to subject "Mathematics"
    And each learning evidence record should be linked to topic "Fractions"
    And each learning evidence record should be linked to skill "Identify equivalent fractions"
    And one activity outcome summary should exist for the completed attempt
    And the outcome summary should show 3 total questions
    And the outcome summary should show 2 correct answers
    And the outcome summary should show the calculated accuracy

  Scenario: Completed answer submissions are immutable
    Given Helena completed the activity "Fractions practice"
    And an answer submission exists for the completed attempt
    When the system tries to change the selected option of that answer submission
    Then the change should be rejected
    And the original selected option should remain unchanged
    And the original correctness value should remain unchanged

  Scenario: Evidence generation is idempotent
    Given Helena completed the activity "Fractions practice"
    And learning evidence has already been generated for the attempt
    When evidence generation runs again for the same attempt
    Then no duplicate learning evidence should be created
    And the number of evidence records for the attempt should remain unchanged
