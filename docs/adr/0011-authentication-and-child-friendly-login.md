# ADR-0011 - Authentication and Child-Friendly Login

## Status

Proposed

## Context

Boom serves both guardians and students.

A guardian account requires stronger identity controls because it manages student data and account settings.

A student needs low-friction access suitable for a child and should not handle sensitive adult identity fields.

## Decision

Boom will separate guardian authentication from student access.

Guardian authentication:

```text
document
phone validation
username/email
password
trusted device later
```

Student access:

```text
profile/avatar
PIN
QR approval from trusted guardian device
restricted student session
```

## Consequences

### Positive

- Better child experience.
- Reduced exposure of sensitive identity data.
- Clear role separation.
- Easier parental control.
- Supports future school/family devices.

### Trade-offs

- More auth flows to implement.
- Requires student-scoped sessions.
- Requires careful authorization checks.
- Requires rate limiting for PIN and QR flows.

## Rules

1. Children should not use document as login.
2. Children should not need guardian phone to study.
3. Student sessions must have restricted permissions.
4. Guardian endpoints must not accept student sessions.
5. PINs must be hashed.
6. QR login must be temporary and single-use.
