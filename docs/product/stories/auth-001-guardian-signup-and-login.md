# Story - AUTH-001 - Guardian Signup and Login

## User Story

As a guardian,
I want to create and access my Boom account securely,
so that I can manage my children's learning profiles and monitor progress.

## Backend Tasks

Create domain concepts:

```text
GuardianAccount
IdentityDocument
PhoneVerificationChallenge
PasswordCredential
AuthSession
AuditEvent
```

Create endpoints:

```text
POST /api/v1/auth/signup
POST /api/v1/auth/login
POST /api/v1/auth/logout
GET  /api/v1/auth/me
POST /api/v1/auth/phone-verification/start
POST /api/v1/auth/phone-verification/confirm
```

## Backend Security Requirements

- Passwords must be hashed with a strong adaptive algorithm.
- Plain-text passwords must never be logged or stored.
- Identity document raw values must not be exposed in API responses.
- Document number should be stored using masked value plus searchable hash.
- Phone number must be validated before the account becomes fully active.
- Login errors must not reveal whether username, document or phone exists.
- Failed login attempts must be rate limited.
- Signup attempts must be rate limited by IP and normalized phone/document hash.
- Responses must use generic error messages.
- Session/token must be revocable.
- Logout must invalidate the session.

## Frontend Tasks

Create pages:

```text
/signup
/login
/verify-phone
```

Create components:

```text
SignupForm
LoginForm
PhoneVerificationForm
AuthErrorMessage
PasswordInput
```

## Frontend Security Requirements

- Do not store passwords.
- Do not store tokens in localStorage if using cookie sessions.
- Do not print auth payloads in console.
- Do not expose raw document values after submit.
- Use HTTPS-only cookies in cloud environments.

## Tests

- signup creates guardian account
- duplicate document does not leak enumeration
- duplicate phone does not leak enumeration
- login succeeds with valid credentials
- login fails with generic error
- `/auth/me` requires authentication
- logout invalidates session
- password is never stored in plain text
- document masking works

## Acceptance Criteria

1. A guardian can sign up with document, phone, username/email and password.
2. A guardian can validate phone.
3. A guardian can log in.
4. The backend returns `/auth/me` for authenticated guardians.
5. Plain-text password is never stored.
6. Raw document is never exposed in responses.
7. Failed login uses generic error.
8. Failed login attempts are rate limited.
9. Signup attempts are rate limited.
10. Auth events are auditable.
