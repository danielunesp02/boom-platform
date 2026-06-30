# Database Model Draft - Coaching Agent Profile

## Purpose

This document is a future persistence draft. It should not be implemented until the core `student` model is stable.

## Candidate Table

```text
coaching_agent_profile
```

## Candidate Columns

```text
id UUID PRIMARY KEY
student_id UUID NOT NULL
locale VARCHAR(16) NOT NULL
target_country VARCHAR(64)
target_school_system VARCHAR(128)
teaching_method VARCHAR(64) NOT NULL
learning_strategy VARCHAR(64) NOT NULL
communication_tone VARCHAR(64) NOT NULL
explanation_depth VARCHAR(64) NOT NULL
ai_provider VARCHAR(64) NOT NULL
ai_model VARCHAR(128)
temperature NUMERIC(3,2) NOT NULL
max_tokens INTEGER
hallucination_policy VARCHAR(64) NOT NULL
grounding_policy VARCHAR(64) NOT NULL
safety_policy VARCHAR(64) NOT NULL
fallback_strategy VARCHAR(64) NOT NULL
status VARCHAR(32) NOT NULL
version INTEGER NOT NULL
created_at TIMESTAMPTZ NOT NULL
updated_at TIMESTAMPTZ NOT NULL
activated_at TIMESTAMPTZ
replaced_at TIMESTAMPTZ
```

## Suggested Constraints

```text
student_id references student(id)
temperature between 0 and 2
version >= 1
one active profile per student
```

For PostgreSQL, one active profile per student could be represented by a partial unique index:

```sql
CREATE UNIQUE INDEX uq_active_coaching_agent_profile
ON coaching_agent_profile(student_id)
WHERE status = 'ACTIVE';
```

## Future AI Request Link

`ai_request_log` should reference:

```text
coaching_agent_profile_id
coaching_agent_profile_version
```

This allows Boom to answer:

- which configuration was used?
- which model generated the response?
- what grounding policy was active?
- what hallucination policy was active?
