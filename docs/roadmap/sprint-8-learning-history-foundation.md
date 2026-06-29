# Sprint 8 - Learning History Foundation

## Goal

Implement the backend foundation for preserving detailed learning history and generating action plans.

## Scope

1. AssessmentAttempt.
2. AnswerSubmission.
3. LearningEvidence.
4. LearningGap.
5. ActivityOutcomeSummary.
6. LearningActionPlan.
7. LearningActionPlanItem.
8. Flyway migrations.
9. Application services.
10. BDD scenarios for critical flows.

## Acceptance Criteria

- Completing an activity creates an attempt.
- Submitting answers creates answer submissions.
- Completing an attempt generates learning evidence.
- Incorrect/repeated weak evidence creates or updates gaps.
- Practice time can be measured against a gap.
- Activity completion generates an outcome summary.
- Action plan is created or updated based on gap.
- Historical records are not overwritten.
- BDD scenarios pass for critical flows.

## Out of Scope

- React frontend.
- Real AI generation.
- Gamification.
- Mobile app.
- Full teacher workflow.
