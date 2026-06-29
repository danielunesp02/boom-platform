# Database Model Draft - Learning History and Parent Dashboard

## Candidate Tables

```text
assessment_attempt
answer_submission
learning_evidence
learning_gap
activity_outcome_summary
learning_action_plan
learning_action_plan_item
daily_learning_summary
subject_performance_snapshot
topic_performance_snapshot
skill_mastery_snapshot
guardian_student_relationship
```

## Table Notes

### assessment_attempt

Stores historical attempts.

Important fields:

- id
- student_id
- activity_id
- started_at
- finished_at
- duration_seconds
- status
- created_at

### answer_submission

Stores answers.

Important fields:

- id
- attempt_id
- question_id
- selected_option_id
- is_correct
- response_time_seconds
- confidence_level
- submitted_at

### learning_evidence

Analytical history.

Important fields:

- id
- student_id
- activity_id
- attempt_id
- answer_submission_id
- subject_id
- topic_id
- subtopic_id
- learning_objective_id
- knowledge_node_id
- skill_node_id
- evidence_type
- result
- difficulty_level
- response_time_seconds
- confidence_level
- occurred_at
- created_at

### learning_gap

Tracked learning issue.

Important fields:

- id
- student_id
- subject_id
- topic_id
- subtopic_id
- learning_objective_id
- skill_node_id
- status
- severity
- first_detected_at
- last_detected_at
- resolved_at
- evidence_count
- incorrect_answer_count
- total_practice_time_seconds
- current_action_plan_id
- created_at
- updated_at

### activity_outcome_summary

Summary after delivery.

Important fields:

- id
- student_id
- activity_id
- attempt_id
- summary_date
- overall_result
- total_questions
- correct_answers
- accuracy
- total_duration_seconds
- summary_text
- recommended_action_plan_id
- generated_by
- reviewed_by
- created_at

### learning_action_plan

Action plan.

Important fields:

- id
- student_id
- source_activity_id
- source_gap_id
- title
- description
- status
- priority
- target_subject_id
- target_topic_id
- target_skill_node_id
- estimated_effort_minutes
- started_at
- due_date
- completed_at
- created_at
- updated_at

### learning_action_plan_item

Actionable plan item.

Important fields:

- id
- action_plan_id
- item_type
- title
- description
- expected_duration_minutes
- status
- order_index
- created_at
- updated_at

### guardian_student_relationship

Controls parent dashboard access.

Important fields:

- id
- guardian_user_id
- student_id
- relationship_type
- status
- created_at
- updated_at

## Indexing Considerations

Recommended indexes:

```text
assessment_attempt(student_id, started_at)
answer_submission(attempt_id)
learning_evidence(student_id, occurred_at)
learning_evidence(student_id, subject_id, occurred_at)
learning_evidence(student_id, skill_node_id, occurred_at)
learning_gap(student_id, status)
learning_gap(student_id, subject_id, status)
daily_learning_summary(student_id, date)
guardian_student_relationship(guardian_user_id, student_id, status)
```

## Data Retention Principle

For MVP:

- keep attempts;
- keep answer submissions;
- keep learning evidence;
- keep gaps;
- keep summaries.

Do not delete history unless an explicit privacy/data deletion process is implemented later.
