# Sprint - Authentication and Security Foundation

## Goal

Create the documentation and implementation plan for Boom's authentication, child-friendly login and API security baseline.

## Stories

```text
AUTH-001 - Guardian Signup and Login
AUTH-002 - Student Friendly Login with PIN
AUTH-003 - QR Device Approval Login
AUTH-004 - API Security Baseline
AUTH-005 - AI Cost and Abuse Protection
```

## Recommended Implementation Order

### Step 1 - Documentation and Domain Decisions

```text
AUTH-001 documentation
AUTH-002 documentation
AUTH-003 documentation
AUTH-004 security baseline
AUTH-005 AI cost protection
```

### Step 2 - Backend Foundation

```text
GuardianAccount
PasswordCredential
IdentityDocument
PhoneVerificationChallenge
AuthSession
basic signup/login/me/logout
security filter baseline
```

### Step 3 - Frontend Guardian Auth

```text
signup page
login page
phone validation page
auth context
protected routes
```

### Step 4 - Student Friendly Login

```text
StudentProfile
StudentPinCredential
student profile selector
PIN login
student session
```

### Step 5 - QR Login

```text
TrustedDevice
QrLoginChallenge
QR page
mobile approval page
polling/consume flow
```

### Step 6 - AI Protection

```text
AI quota
AI rate limit
AI kill switch
AiRequestLog
budget/usage documentation
```

## Definition of Done

- Documentation committed.
- Security baseline agreed.
- Backend and frontend tasks are explicit.
- Abuse scenarios documented.
- AI cost protection documented.
- Next implementation patch can be generated from these docs.
