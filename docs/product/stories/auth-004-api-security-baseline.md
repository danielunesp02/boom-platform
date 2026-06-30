# Story - AUTH-004 - API Security Baseline

## User Story

As the platform,
I want every API to be protected by default,
so that sensitive data, AI credits and infrastructure resources are not exposed to abuse.

## Backend Tasks

Implement or configure:

```text
authentication filter
authorization filter
rate limit filter
request correlation id
request size limit
generic error handler
security headers
structured audit logging
```

## Endpoint Classification

Every endpoint must be classified as one of:

```text
PUBLIC
AUTHENTICATED_GUARDIAN
AUTHENTICATED_STUDENT
AUTHENTICATED_ADMIN
INTERNAL
AI_EXPENSIVE
```

## Default Rule

```text
deny by default
allow only explicitly classified endpoints
```

## Authorization Rules

- Guardian endpoints must check guardian ownership.
- Student endpoints must check student session scope.
- Parent dashboard must check `GuardianStudentRelationship`.
- Object IDs from the request must never be trusted without ownership checks.
- DTOs must avoid mass assignment.
- Sensitive fields must never be returned by default.

## Rate Limiting

Apply rate limits by:

```text
IP
account id
student id
device id
endpoint group
AI cost class
```

Endpoint groups:

```text
auth_login
auth_signup
pin_login
qr_poll
qr_approve
parent_dashboard
ai_generation
```

## Error Handling

- Do not leak stack traces.
- Do not leak SQL errors.
- Do not reveal whether a document/phone/user exists.
- Return correlation id for support.
- Return safe error codes.

## Logging Rules

Never log:

```text
password
PIN
raw document number
full phone number
OpenAI API key
session token
authorization header
QR challenge raw secret
```

## Frontend Tasks

- Centralize API client.
- Handle 401/403/429 globally.
- Avoid logging sensitive payloads in console.
- Redirect unauthenticated users to login.
- Show friendly rate-limit messages.
- Do not expose stack traces to the user.

## Acceptance Criteria

1. API is deny-by-default.
2. Every endpoint has classification.
3. Ownership is enforced for student data.
4. Auth endpoints are rate limited.
5. AI endpoints are rate limited and budget protected.
6. Sensitive values are not logged.
7. 401/403/429 are handled consistently.
8. Tests prove cross-user access is blocked.
