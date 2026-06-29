# Sprint 7 - Signup and Identity Verification

## Goal

Allow pre-registered users to activate their accounts using primary document, email verification, phone verification and PIN.

## Scope

1. IdentityDocument model.
2. ContactChannel model.
3. SignupInvitation model.
4. VerificationChallenge model.
5. PinCredential model.
6. Signup start endpoint.
7. Email verification endpoint.
8. Phone verification endpoint.
9. PIN creation endpoint.
10. Account activation endpoint.

## Acceptance Criteria

- Imported user receives pending signup state.
- User can start signup using primary document.
- System finds pending invitation using normalized document hash.
- System sends or simulates email verification code.
- System sends or simulates phone verification code.
- User can verify email.
- User can verify phone.
- User can create PIN.
- PIN is hashed.
- Account becomes active after successful activation.
- Verification attempts are rate-limited or prepared for rate limiting.

## Out of Scope

- Real SMS provider integration.
- Real email provider integration.
- SSO.
- Passkeys.
- Password-based login.
- Mobile app.
