# Story - AUTH-003 - QR Device Approval Login

## User Story

As a guardian,
I want to approve a student's login from my trusted mobile device,
so that the child can enter Boom easily on a browser or shared device.

## Core Rule

The QR code must not contain a final login token.

The QR code should contain only a temporary challenge reference.

## Backend Tasks

Create domain concepts:

```text
TrustedDevice
QrLoginChallenge
QrChallengeApproval
```

Create endpoints:

```text
POST /api/v1/auth/devices/register
GET  /api/v1/auth/devices
DELETE /api/v1/auth/devices/{deviceId}

POST /api/v1/auth/qr/challenges
GET  /api/v1/auth/qr/challenges/{challengeId}/status
POST /api/v1/auth/qr/challenges/{challengeId}/approve
POST /api/v1/auth/qr/challenges/{challengeId}/consume
```

## Security Requirements

- QR challenge must expire quickly.
- QR challenge must be single-use.
- QR code must not include final session token.
- Approval must require a trusted authenticated device.
- Challenge approval must be bound to challenge id, browser session, student id and trusted device.
- Consumed challenge must never be reusable.
- Expired challenge must never be approved or consumed.
- Polling endpoint must be rate limited.
- Challenge id must be high entropy.
- Device registration must require guardian authentication.
- Device revocation must block future approvals.

## Frontend Tasks

Create browser flow:

```text
/qr-login
QrLoginPage
QrCodeDisplay
QrChallengeWaitingState
QrChallengeExpiredState
```

Create mobile flow:

```text
/mobile/approve-login
QrApprovalPage
ApproveStudentLoginCard
DenyLoginButton
```

## Acceptance Criteria

1. Browser can request QR login challenge.
2. QR challenge expires.
3. Trusted mobile device can approve challenge.
4. Browser can consume approved challenge.
5. Consumed challenge cannot be reused.
6. Expired challenge cannot be used.
7. Approval requires trusted authenticated device.
8. Polling is rate limited.
9. QR does not contain session token.
10. Audit events are generated.
