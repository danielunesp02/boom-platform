# Epic - Signup, Identity Document and Verification

## Goal

Allow users who were pre-registered by an admin, school or external system to safely activate their accounts.

Activation should be based on:

- primary identity document;
- email verification;
- phone verification;
- PIN creation.

## Product Rationale

Schools and institutions often already know who the students and guardians are. Boom should allow those users to be pre-created and later activated by the real user.

This avoids requiring each student/guardian to manually fill all information again.

## Core Signup Flow

```text
Admin imports user
  -> System creates pending user
  -> System stores primary identity document
  -> System stores contact channels
  -> System creates signup invitation
  -> User starts signup
  -> User informs primary document
  -> System finds pending invitation
  -> System verifies email
  -> System verifies phone
  -> User creates PIN
  -> Account becomes active
```

## Identity Document Strategy

Do not hardcode CPF as the only identity field.

Use a generic identity document model.

Examples:

```text
BR / CPF
BR / RG
IT / Codice Fiscale
PT / NIF
US / SSN
CUSTOM / Student ID
```

## Security Principles

1. Do not expose full document values unnecessarily.
2. Prefer hashing for lookup.
3. Prefer encryption for controlled display.
4. Store last digits for user confirmation.
5. Keep verification challenges short-lived.
6. Do not store PIN in plain text.
7. Rate-limit signup attempts.
8. Audit activation events.

## MVP Scope

- Start signup using document.
- Verify email.
- Verify phone.
- Create PIN.
- Activate pending account.

## Out of Scope for MVP

- Passwordless passkeys.
- Government document verification.
- Biometric verification.
- SSO.
- Social login.
