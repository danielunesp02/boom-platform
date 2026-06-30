# Architecture - Authentication and API Security

## Overview

Boom separates guardian identity from student access.

```text
Guardian Account
  -> owns/manages Student Profiles
  -> authenticates with password and phone verification
  -> can register trusted devices

Student Profile
  -> belongs to guardian/family
  -> uses PIN or QR-approved session
  -> has restricted permissions
```

## Main Components

```text
AuthController
GuardianSignupUseCase
GuardianLoginUseCase
PhoneVerificationUseCase
StudentPinLoginUseCase
QrLoginChallengeUseCase
TrustedDeviceService
SessionService
AuthorizationService
RateLimitService
AuditEventService
```

## Request Flow - Guardian Login

```text
POST /auth/login
  -> normalize identifier
  -> rate limit by IP + identifier hash
  -> verify password
  -> create session
  -> record audit event
  -> return safe session response
```

## Request Flow - Student PIN Login

```text
POST /student-auth/pin/login
  -> verify student belongs to family/trusted context
  -> rate limit by student/device/IP
  -> verify PIN hash
  -> create student-scoped session
  -> record audit event
```

## Request Flow - QR Login

```text
Browser:
  POST /auth/qr/challenges
  -> receives challenge id and QR payload

Mobile trusted device:
  POST /auth/qr/challenges/{id}/approve

Browser:
  GET /auth/qr/challenges/{id}/status
  POST /auth/qr/challenges/{id}/consume
  -> receives session
```

## Deny-by-Default Rule

New endpoints are blocked unless explicitly configured with:

```text
endpoint classification
authentication requirement
authorization rule
rate limit policy
audit policy
sensitive logging policy
```

## Session Strategy

For the web MVP, prefer secure HTTP-only cookies for browser sessions.

Recommended cookie flags in cloud:

```text
HttpOnly
Secure
SameSite=Lax or Strict depending on flow
short expiration
server-side revocation capability
```

Avoid storing bearer tokens in localStorage.

## AI Protection Layer

AI calls must never be made directly from frontend.

```text
Frontend
  -> Boom Backend
    -> Auth
    -> Authorization
    -> Quota
    -> Rate Limit
    -> AiGateway
      -> Provider
```
