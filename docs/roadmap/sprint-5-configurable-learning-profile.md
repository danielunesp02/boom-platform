# Sprint 5 - Configurable Learning Profile

## Goal

Introduce the first configurable learning objects without implementing full gamification yet.

## Scope

1. LearningPolicy.
2. TeachingMethod.
3. LearningGoal.
4. StudentLearningProfile.
5. SubjectEnrollment.
6. Flyway migrations.
7. Basic CRUD APIs.
8. Seed data for teaching methods.
9. Policy checks for subject/method selection.

## Acceptance Criteria

- Admin can define whether students may select subjects.
- Admin can define whether students may select teaching methods.
- Student can have a learning profile.
- Student can have learning goals.
- Student can be enrolled in subjects.
- Teaching methods can be listed.
- Policy prevents unauthorized selection.
- APIs return clear validation errors.
- Database model supports tenant/organization ownership.

## Suggested API Endpoints

```text
GET    /api/v1/teaching-methods
POST   /api/v1/students/{studentId}/learning-profile
GET    /api/v1/students/{studentId}/learning-profile
POST   /api/v1/students/{studentId}/goals
GET    /api/v1/students/{studentId}/goals
POST   /api/v1/students/{studentId}/subjects
GET    /api/v1/students/{studentId}/subjects
GET    /api/v1/policies/learning
PUT    /api/v1/policies/learning
```

## Out of Scope

- Full authentication.
- Full role/permission system.
- Gamification points.
- Avatar UI.
- AI-generated learning plans.
- Frontend.
