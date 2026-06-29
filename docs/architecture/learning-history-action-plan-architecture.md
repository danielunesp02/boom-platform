# Architecture - Learning History and Action Plan

## Design Principle

Boom should preserve detailed historical evidence and expose simplified aggregated views.

```text
Detailed history for the platform.
Simple insights for the user.
```

## Flow

```text
Student completes activity
  -> AssessmentAttempt completed
    -> AnswerSubmissions persisted
      -> LearningEvidence generated
        -> LearningGap detector runs
          -> ActivityOutcomeSummary generated
            -> LearningActionPlan created/updated
              -> Dashboard aggregates refreshed
```

## Recommended Services

### AssessmentAttemptService

Responsibilities:

- start attempt;
- complete attempt;
- validate attempt status transitions;
- calculate duration.

### AnswerSubmissionService

Responsibilities:

- submit answer;
- calculate correctness;
- persist answer;
- prevent mutation after completion.

### LearningEvidenceService

Responsibilities:

- create evidence from answers;
- enrich with subject/topic/skill metadata;
- enforce append-only behavior;
- avoid duplicate evidence.

### LearningGapService

Responsibilities:

- evaluate evidence;
- create gaps;
- update existing gaps;
- calculate severity;
- update practice time.

### OutcomeSummaryService

Responsibilities:

- generate activity outcome summary;
- identify strengths and weaknesses;
- produce parent-friendly summary;
- link to recommended action plan.

### LearningActionPlanService

Responsibilities:

- create action plan from gap;
- update existing action plan;
- create actionable items;
- mark plan completed/cancelled/superseded.

### ParentDashboardQueryService

Responsibilities:

- enforce guardian access;
- read aggregates;
- compose dashboard response;
- return empty states.

## Architectural Boundaries

### Assessment

Owns:

- attempts;
- answers;
- scoring.

### Analytics

Owns:

- evidence;
- gaps;
- summaries;
- snapshots.

### Guidance

Owns:

- action plans;
- recommendations;
- next steps.

### Parent Dashboard

Owns:

- read-only dashboard composition;
- guardian-specific views.

## Avoid

Avoid making the dashboard calculate everything directly from raw answers on every request.

Bad:

```text
Dashboard Controller -> raw answers -> complex calculations
```

Better:

```text
Activity completion -> summaries/snapshots
Dashboard Query -> summaries/snapshots
```

## Recalculation Strategy

Snapshots and summaries should be recalculable.

Historical facts should not be overwritten.

```text
Raw history = source of truth
Snapshots = optimization
Dashboard = read model
```

## React Web First

Current frontend strategy:

- React Web
- TypeScript
- Vite
- TanStack Query
- React Router
- Reusable dashboard components

Out of scope for now:

- React Native
- Expo
- Mobile app
- Universal components

## Suggested API Endpoints

```text
GET /api/v1/parents/dashboard
GET /api/v1/students/{studentId}/activity-history
GET /api/v1/students/{studentId}/subject-performance
GET /api/v1/students/{studentId}/learning-gaps
GET /api/v1/students/{studentId}/current-action-plan
GET /api/v1/students/{studentId}/recent-activity-summaries
```
