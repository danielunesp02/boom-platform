# Epic - Learning History and Action Plan

## Goal

Persist a complete and structured history of each student's learning activity so Boom can measure evolution, detect gaps, calculate time spent on remediation and generate an action plan after each learning delivery.

## Business Rationale

Boom should not only know the current performance of a student. It must understand the student's learning journey over time.

The platform needs to answer questions such as:

- Which topics is the student performing well in?
- Which topics is the student struggling with?
- How long has the student been working on a specific gap?
- How much practice time has been spent on a specific issue?
- Did the student improve after an action plan?
- Is the same misconception recurring?
- Is performance improving, stable, regressing or inconsistent?

## Product Scope

The epic covers:

1. Assessment attempt history.
2. Answer-level history.
3. Learning evidence generation.
4. Topic/skill/objective-level gap detection.
5. Time spent against gaps.
6. Outcome summary after each completed activity.
7. Action plan generation and tracking.
8. Historical data model prepared for analytics and AI.

## Non-Goals

This epic does not implement:

- Full AI generation.
- Frontend dashboard.
- Gamification.
- Complex teacher workflows.
- Full event sourcing infrastructure.
- Data warehouse pipelines.

## Business Rules

1. Every completed activity must generate a persistent attempt record.
2. Every answered question must generate an immutable answer submission.
3. Every relevant answer/activity must generate learning evidence.
4. Learning evidence must be associated with subject, topic, subtopic, skill and/or learning objective whenever available.
5. When weak performance is detected, the system must create or update a learning gap.
6. Time spent practicing should be measurable per gap.
7. Every completed learning delivery must generate an outcome summary.
8. Every outcome summary should be able to reference a recommended action plan.
9. Action plans may span multiple days.
10. Dashboard summaries must be derived from historical evidence, not from manually overwritten counters.

## MVP

The MVP should support:

- Activity attempt persistence.
- Answer submission persistence.
- Evidence creation from submissions.
- Basic gap detection.
- Daily/outcome summary creation.
- Basic action plan creation.
- APIs for dashboard aggregation.

## Success Metrics

- The system can show a student's performance by subject/topic over time.
- The system can identify at least one active gap per student.
- The system can show how much time has been spent working on a gap.
- The system can show the current action plan for a student.
- A parent can understand the student's week in less than one minute.
