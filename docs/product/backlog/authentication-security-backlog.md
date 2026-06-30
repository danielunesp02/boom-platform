# Backlog - Authentication and Security

## P0

| ID | Story | Area |
|---|---|---|
| AUTH-001 | Guardian Signup and Login | Auth |
| AUTH-004 | API Security Baseline | Security |
| AUTH-005 | AI Cost and Abuse Protection | Security/AI |

## P1

| ID | Story | Area |
|---|---|---|
| AUTH-002 | Student Friendly Login with PIN | Auth/UX |
| AUTH-003 | QR Device Approval Login | Auth/UX |
| AUTH-006 | Session Revocation and Device Management | Security |
| AUTH-007 | Audit Event Dashboard | Observability |

## P2

| ID | Story | Area |
|---|---|---|
| AUTH-008 | Passkeys for Guardians | Passwordless |
| AUTH-009 | Admin Security Policy Configuration | Admin |
| AUTH-010 | Advanced Anomaly Detection | Security |

## Recommended First Technical Commit

```text
feat: add guardian authentication foundation
```

Includes:

```text
GuardianAccount
PasswordCredential
IdentityDocument
signup/login/me/logout
rate limit placeholders
generic error handler
tests
```
