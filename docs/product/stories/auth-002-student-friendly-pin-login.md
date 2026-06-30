# Story - AUTH-002 - Student Friendly Login with PIN

## User Story

As a student,
I want to enter Boom by selecting my profile and typing a simple PIN,
so that I can start studying without handling adult credentials.

## Product Scope

The student should not log in with:

- document
- phone
- email
- complex password

The student should use:

```text
profile/avatar + PIN
```

## Backend Tasks

Create domain concepts:

```text
StudentProfile
StudentPinCredential
StudentSessionContext
GuardianStudentRelationship
```

Create endpoints:

```text
GET  /api/v1/family/students
POST /api/v1/student-auth/pin/login
POST /api/v1/student-auth/logout
GET  /api/v1/student-auth/me
```

## Security Requirements

- PIN must be hashed.
- PIN must never be logged.
- PIN attempts must be rate limited by student id, family id, device/session id and IP.
- PIN failure must not expose whether a student id exists.
- Student session must be scoped to student permissions.
- Student session cannot access guardian-only endpoints.
- Guardian must create/reset student PIN.
- Student profile listing requires guardian authentication or trusted device context.

## Frontend Tasks

Create pages/components:

```text
/who-is-studying
/student-pin
StudentProfileSelector
StudentAvatarCard
PinInput
StudentLoginError
```

## Acceptance Criteria

1. Guardian can create a student profile.
2. Student can select profile/avatar.
3. Student can enter PIN.
4. Valid PIN creates student session.
5. Invalid PIN does not reveal sensitive information.
6. Repeated invalid PIN attempts are rate limited.
7. Student session cannot access guardian endpoints.
8. PIN is stored as hash only.
