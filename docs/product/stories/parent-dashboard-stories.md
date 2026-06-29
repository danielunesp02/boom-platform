# User Stories - Parent Dashboard

## PD-001 - View parent dashboard

As a parent/guardian,
I want to view a simple dashboard for my student,
so that I can understand recent learning activity and performance.

### Business Refinement

The dashboard should be read-only and designed for clarity.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/parents/dashboard
```

The endpoint should return:

- linked students;
- selected student;
- weekly summary;
- activity history;
- subject performance;
- learning gaps;
- current action plan;
- recent activity summaries.

### Acceptance Criteria

- Parent can only see students linked to their guardian relationship.
- Dashboard is read-only.
- Dashboard returns data for a default period when no period is supplied.
- Dashboard returns empty-state-friendly data when there is no activity.
- Dashboard response avoids exposing raw sensitive data.
- Dashboard loads from aggregates where possible.

### Priority

P0

---

## PD-002 - Select student

As a parent/guardian,
I want to switch between linked students,
so that I can view each child's learning status.

### Business Refinement

Families may have more than one student.

### Technical Refinement

The parent dashboard response should include a student list.

Recommended fields:

- studentId
- displayName
- currentGradeLevel
- latestActivityDate
- dashboardAvailable

### Acceptance Criteria

- Parent can list only linked students.
- Parent can request dashboard for one linked student.
- Requesting an unlinked student is denied.
- Student selector supports one or more students.

### Priority

P1

---

## PD-003 - View activity history chart

As a parent/guardian,
I want to see a chart of recent activities,
so that I can understand frequency, time spent and consistency.

### Business Refinement

The chart should show study rhythm, not raw technical data.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/students/{studentId}/activity-history
```

Recommended response fields:

- date
- completedActivities
- totalDurationSeconds
- accuracy
- totalQuestions

### Acceptance Criteria

- Chart data is returned by day.
- Data includes completed activity count.
- Data includes total study time.
- Data includes average accuracy when available.
- Missing days are represented consistently.
- Parent can only access linked student data.

### Priority

P0

---

## PD-004 - View subject performance

As a parent/guardian,
I want to see performance by subject,
so that I can understand where the student is strong or struggling.

### Business Refinement

Subject cards should be simple and readable.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/students/{studentId}/subject-performance
```

Recommended response fields:

- subjectId
- subjectName
- accuracy
- totalQuestions
- totalDurationSeconds
- trend
- activeGapCount

Trend values:

- IMPROVING
- STABLE
- DECLINING
- INSUFFICIENT_DATA

### Acceptance Criteria

- Subject performance is calculated from historical evidence.
- Subject cards include accuracy.
- Subject cards include study time.
- Subject cards include trend when enough data exists.
- Subject cards show insufficient data when needed.
- Parent can only access linked student data.

### Priority

P0

---

## PD-005 - View learning gaps

As a parent/guardian,
I want to see the student's active learning gaps,
so that I know what needs attention.

### Business Refinement

The dashboard should show parent-friendly labels and avoid overwhelming detail.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/students/{studentId}/learning-gaps
```

Recommended response fields:

- gapId
- subjectName
- topicName
- skillName
- severity
- status
- daysOpen
- totalPracticeTimeSeconds
- lastDetectedAt

### Acceptance Criteria

- Only active or recently resolved gaps are shown.
- Each gap shows subject/topic/skill when available.
- Each gap shows severity.
- Each gap shows how long it has been open.
- Each gap shows practice time.
- Parent can only access linked student data.

### Priority

P0

---

## PD-006 - View current action plan

As a parent/guardian,
I want to see the current action plan,
so that I know what Boom recommends next.

### Business Refinement

The action plan should be concise and practical.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/students/{studentId}/current-action-plan
```

Recommended response fields:

- actionPlanId
- title
- description
- targetSubject
- targetTopic
- targetSkill
- priority
- estimatedEffortMinutes
- status
- progressPercentage
- items

### Acceptance Criteria

- Dashboard shows the current active action plan.
- Plan items are displayed in order.
- Each item includes expected duration.
- If no plan exists, a friendly empty state is returned.
- Parent can only access linked student data.

### Priority

P0

---

## PD-007 - View recent activity timeline

As a parent/guardian,
I want to see recent learning activity summaries,
so that I can understand what happened recently without reading raw answers.

### Business Refinement

The timeline should use outcome summaries.

### Technical Refinement

Create endpoint:

```text
GET /api/v1/students/{studentId}/recent-activity-summaries
```

Recommended response fields:

- date
- activityTitle
- subjectName
- accuracy
- durationSeconds
- summaryText
- recommendedActionPlanId

### Acceptance Criteria

- Timeline shows recent completed activities.
- Each item uses a parent-friendly summary.
- Raw question/answer details are not required in MVP.
- Timeline is ordered by most recent first.
- Parent can only access linked student data.

### Priority

P1
