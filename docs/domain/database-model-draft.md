# Database Model Draft

## Purpose

This document is a bridge between product/domain thinking and future Flyway migrations.

It is not yet the final migration script.

## Candidate Tables

### Configurable Learning

```text
learning_policy
teaching_method
student_learning_profile
learning_goal
subject_enrollment
```

### Gamification

```text
gamification_profile
points_wallet
points_transaction
achievement
student_achievement
streak
avatar_theme
avatar
avatar_item
reward_rule
```

## Notes

- Prefer UUID primary keys.
- Use `tenant_id` where data is tenant-scoped.
- Use immutable records for `points_transaction`.
- Store policy changes in audit log later.
- Avoid storing complex business logic only as JSON if queryability is important.
- JSONB may be useful for flexible rule conditions and criteria.
- Keep gamification optional through policy.
- Keep avatar assets separate from domain records.
