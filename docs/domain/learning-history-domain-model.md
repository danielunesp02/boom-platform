# Learning History Domain Model

## Overview

The learning history model is designed to support:

- historical analysis;
- dashboard aggregation;
- gap tracking;
- action plan generation;
- future AI recommendations;
- future gamification.

## Core Model

```text
LearningActivity
  -> AssessmentAttempt
    -> AnswerSubmission
      -> LearningEvidence
        -> LearningGap
          -> LearningActionPlan
            -> LearningActionPlanItem
```

## Core Entities

### AssessmentAttempt

Represents one execution of a learning activity by a student.

Lifecycle:

```text
STARTED -> COMPLETED
STARTED -> ABANDONED
STARTED -> EXPIRED
```

### AnswerSubmission

Represents one student answer.

Important rule:

```text
After an attempt is completed, answer submissions become immutable.
```

### LearningEvidence

Represents analytical evidence extracted from attempts and answers.

Important rule:

```text
Evidence is append-only and should never replace raw submissions.
```

### LearningGap

Represents a tracked learning issue.

A gap may be associated with:

- subject;
- topic;
- subtopic;
- learning objective;
- knowledge node;
- skill node.

The most specific available dimension should be used.

### ActivityOutcomeSummary

Represents the result summary of one completed delivery.

This is the object that can be shown to parents and used by AI later.

### LearningActionPlan

Represents the remediation or reinforcement plan.

A plan may be:

- proposed;
- active;
- completed;
- cancelled;
- superseded.

### LearningActionPlanItem

Represents one concrete action.

Examples:

- review content;
- practice questions;
- retry activity;
- watch explanation;
- read summary;
- ask guardian help.

## Derived/Aggregate Entities

### DailyLearningSummary

Derived from attempts, submissions and evidence.

### SubjectPerformanceSnapshot

Derived from evidence grouped by subject.

### TopicPerformanceSnapshot

Derived from evidence grouped by topic/subtopic.

### SkillMasterySnapshot

Derived from evidence grouped by skill.

## Invariants

1. Attempts are historical records.
2. Completed attempts are not mutated for scoring changes.
3. Answer submissions are immutable after completion.
4. Evidence is append-only.
5. Gaps are updated based on evidence.
6. Snapshots are derived and recalculable.
7. Dashboards use snapshots and summaries, not raw submissions directly.
8. Action plans are linked to evidence/gaps.
9. Parent views are read-only.
10. Guardian data access must be scoped by student relationship.
