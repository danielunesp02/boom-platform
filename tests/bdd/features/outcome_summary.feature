Feature: Activity outcome summary

  Every completed learning delivery should generate a parent-friendly outcome summary
  and connect the summary to the next action when needed.

  Background:
    Given a student named "Helena" exists
    And a learning activity exists with questions across multiple skills

  Scenario: Outcome summary identifies strengths and weaknesses
    When Helena completes the activity with strong performance in "Reading charts"
    And Helena performs poorly in "Equivalent fractions"
    Then an activity outcome summary should be created
    And the summary should include "Reading charts" as a strength
    And the summary should include "Equivalent fractions" as an attention area
    And the summary should include a parent-friendly text explanation

  Scenario: Outcome summary links to recommended action plan
    Given Helena performs poorly in "Equivalent fractions"
    When the activity outcome summary is generated
    Then a recommended action plan should be linked to the summary
    And the action plan should target "Equivalent fractions"
    And the action plan should include at least one next step
