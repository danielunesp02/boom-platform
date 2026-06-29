# ADR-0009 - Learning History, Action Plan and Parent Dashboard

## Status

Proposed

## Context

Boom needs to support long-term analysis of student learning evolution. The parent dashboard should remain simple, but the backend must preserve enough detail to support analytics, AI recommendations, gap tracking and future gamification.

The product direction is to show parents a simple read-only dashboard while storing detailed historical evidence behind the scenes.

## Decision

Boom will persist detailed learning history using:

- AssessmentAttempt
- AnswerSubmission
- LearningEvidence
- LearningGap
- ActivityOutcomeSummary
- LearningActionPlan
- LearningActionPlanItem
- DailyLearningSummary
- Performance snapshots

The parent dashboard will consume read models and aggregates instead of recalculating from raw answers at request time.

React Web will be used as the first frontend strategy. Mobile app considerations are explicitly deferred.

## Consequences

### Positive

- Supports learning evolution analysis.
- Supports gap tracking by topic and skill.
- Supports time-spent-on-gap measurement.
- Supports parent dashboard.
- Supports future AI and gamification.
- Keeps parent UX simple.
- Preserves historical facts.

### Trade-offs

- More backend model complexity.
- Requires aggregate/snapshot generation.
- Requires careful immutability rules.
- Requires access control for guardian/student relationship.
- Requires clear separation between raw history and dashboard read models.

## Invariants

1. Raw learning history must not be lost.
2. Completed attempts must not be casually mutated.
3. Answer submissions are immutable after completion.
4. Evidence is append-only.
5. Gaps are derived from evidence.
6. Action plans are linked to gaps and summaries.
7. Parent dashboard is read-only.
8. Parent access must be scoped to linked students.
9. Mobile app is out of scope for the current phase.
