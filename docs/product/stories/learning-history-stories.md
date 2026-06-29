# User Stories - Learning History and Action Plan

## LH-001 - Persist assessment attempt

As the platform,
I want to persist every student assessment attempt,
so that the student's learning activity history is not lost.

### Business Refinement

An attempt represents a student's execution of an activity. It must capture start time, finish time, duration and status.

### Technical Refinement

Create `AssessmentAttempt`.

Recommended fields:

- id
- studentId
- activityId
- startedAt
- finishedAt
- durationSeconds
- status
- createdAt

Statuses:

- STARTED
- COMPLETED
- ABANDONED
- EXPIRED

### Acceptance Criteria

- A new attempt is created when the student starts an activity.
- The attempt is completed when the student finishes the activity.
- Duration is calculated from start and finish timestamps.
- Completed attempts cannot be deleted through normal application flow.
- A student can have multiple attempts for the same activity if the activity rules allow it.
- Attempt status must be explicit.

### Priority

P0

---

## LH-002 - Persist answer submissions

As the platform,
I want to persist each submitted answer,
so that performance can be analyzed at question, topic and skill level.

### Business Refinement

Each answer is evidence. It must capture correctness, response time, selected option and confidence if provided.

### Technical Refinement

Create `AnswerSubmission`.

Recommended fields:

- id
- attemptId
- questionId
- selectedOptionId
- isCorrect
- responseTimeSeconds
- confidenceLevel
- submittedAt

Confidence levels:

- LOW
- MEDIUM
- HIGH
- NOT_PROVIDED

### Acceptance Criteria

- Each answered question creates one answer submission.
- The answer submission is linked to an attempt.
- Correctness is persisted.
- Response time is persisted when available.
- Confidence is persisted when available.
- Submitted answers are immutable after the attempt is completed.
- The system can retrieve all answers for an attempt.

### Priority

P0

---

## LH-003 - Generate learning evidence

As the platform,
I want to generate structured learning evidence from attempts and answers,
so that analytics, gaps, AI and dashboards can use a consistent historical model.

### Business Refinement

Learning evidence is the analytical representation of what happened. It should connect performance with subject, topic, skill, learning objective and time.

### Technical Refinement

Create `LearningEvidence`.

Recommended fields:

- id
- studentId
- activityId
- attemptId
- answerSubmissionId
- subjectId
- topicId
- subtopicId
- learningObjectiveId
- knowledgeNodeId
- skillNodeId
- evidenceType
- result
- difficultyLevel
- responseTimeSeconds
- confidenceLevel
- occurredAt
- createdAt

Evidence types:

- QUESTION_CORRECT
- QUESTION_INCORRECT
- ACTIVITY_COMPLETED
- SKILL_IMPROVED
- GAP_DETECTED
- GAP_REINFORCED
- GAP_RESOLVED
- REVIEW_COMPLETED

### Acceptance Criteria

- Evidence is generated for each answer submission.
- Evidence includes subject/topic/skill metadata when available.
- Evidence preserves the original event time.
- Evidence is append-only.
- Evidence can be queried by student, subject, topic and skill.
- Evidence generation can be rerun safely without duplicate records.

### Priority

P0

---

## LH-004 - Detect learning gaps

As the platform,
I want to detect when a student struggles with a topic or skill,
so that Boom can track and address the problem over time.

### Business Refinement

A gap is not just one wrong answer. A gap should represent a meaningful weakness based on repeated evidence, important concepts or low confidence.

### Technical Refinement

Create `LearningGap`.

Recommended fields:

- id
- studentId
- subjectId
- topicId
- subtopicId
- learningObjectiveId
- skillNodeId
- status
- severity
- firstDetectedAt
- lastDetectedAt
- resolvedAt
- evidenceCount
- incorrectAnswerCount
- totalPracticeTimeSeconds
- currentActionPlanId
- createdAt
- updatedAt

Statuses:

- OPEN
- IN_PROGRESS
- IMPROVING
- RESOLVED
- REGRESSED
- IGNORED

Severity:

- LOW
- MEDIUM
- HIGH
- CRITICAL

### Acceptance Criteria

- The system creates a gap when configured evidence rules are met.
- The gap is linked to the most specific available learning dimension.
- Existing open gaps are updated rather than duplicated.
- Gap severity can increase or decrease.
- Gap status can move from OPEN to IN_PROGRESS, IMPROVING and RESOLVED.
- The system tracks when the gap was first and last detected.
- The system can calculate or store total practice time related to the gap.

### Priority

P0

---

## LH-005 - Generate activity outcome summary

As the platform,
I want to generate an outcome summary after each completed activity,
so that parents, students and future AI features understand what happened.

### Business Refinement

Every completed delivery should produce a concise summary of performance, strengths, weaknesses and recommended next step.

### Technical Refinement

Create `ActivityOutcomeSummary`.

Recommended fields:

- id
- studentId
- activityId
- attemptId
- summaryDate
- overallResult
- totalQuestions
- correctAnswers
- accuracy
- totalDurationSeconds
- strongestSubjectIds
- weakestSubjectIds
- strongestSkillIds
- weakestSkillIds
- detectedGapIds
- recommendedActionPlanId
- summaryText
- generatedBy
- reviewedBy
- createdAt

Generated by:

- SYSTEM_RULES
- AI
- HUMAN

### Acceptance Criteria

- A summary is created after an activity attempt is completed.
- Summary includes total questions, correct answers, accuracy and duration.
- Summary identifies strengths when evidence exists.
- Summary identifies weaknesses/gaps when evidence exists.
- Summary references an action plan when one is created or updated.
- Summary text is understandable to a parent/guardian.
- Summary can be regenerated without losing the original historical evidence.

### Priority

P0

---

## LH-006 - Create or update learning action plan

As the platform,
I want to create or update an action plan after each learning delivery,
so that the student has a clear path to improve.

### Business Refinement

The action plan should not be recreated blindly every day. If the same gap remains active, the system should update the current plan or add new items.

### Technical Refinement

Create:

- `LearningActionPlan`
- `LearningActionPlanItem`

Recommended fields for `LearningActionPlan`:

- id
- studentId
- sourceActivityId
- sourceGapId
- title
- description
- status
- priority
- targetSubjectId
- targetTopicId
- targetSkillNodeId
- estimatedEffortMinutes
- startedAt
- dueDate
- completedAt
- createdAt
- updatedAt

Recommended fields for `LearningActionPlanItem`:

- id
- actionPlanId
- itemType
- title
- description
- expectedDurationMinutes
- status
- orderIndex
- createdAt
- updatedAt

Plan statuses:

- PROPOSED
- ACTIVE
- COMPLETED
- CANCELLED
- SUPERSEDED

Item types:

- REVIEW_CONTENT
- PRACTICE_QUESTIONS
- WATCH_EXPLANATION
- RETRY_ACTIVITY
- READ_SUMMARY
- DO_CHALLENGE
- ASK_GUARDIAN_HELP

### Acceptance Criteria

- A plan can be created from a detected gap.
- If an active plan already exists for the same gap, the system updates it instead of duplicating it.
- A plan contains at least one actionable item.
- Each item has estimated effort.
- The plan can be linked to an outcome summary.
- A completed plan can be associated with gap improvement or resolution.
- The current action plan can be retrieved for the parent dashboard.

### Priority

P0

---

## LH-007 - Generate daily learning summary

As the platform,
I want to generate a daily summary of learning activity,
so that dashboards can load fast and consistently.

### Business Refinement

The daily summary is an aggregate view. It should be derived from attempts, answers and evidence.

### Technical Refinement

Create `DailyLearningSummary`.

Recommended fields:

- id
- studentId
- date
- totalActivities
- completedActivities
- totalQuestions
- correctAnswers
- accuracy
- totalDurationSeconds
- activeGapCount
- resolvedGapCount
- createdAt
- updatedAt

### Acceptance Criteria

- Summary is generated from historical records.
- Summary can be recalculated.
- Summary does not replace raw historical evidence.
- Summary supports parent dashboard weekly view.
- Summary is scoped by student and date.

### Priority

P1
