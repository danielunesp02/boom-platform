# Epic - Authentication and API Security

## Goal

Create a secure and child-friendly authentication foundation for Boom.

Boom must support:

- guardian signup and login
- phone validation
- identity document registration
- student-friendly access
- PIN-based student login
- QR device approval login
- strong API protection
- AI cost abuse protection
- secure handling of sensitive user data

## Core Principle

Legal identity and daily student access are different concerns.

```text
Guardian identity:
  document
  phone
  username/email
  password
  trusted device

Student access:
  avatar/profile
  PIN
  guardian-approved device
  restricted permissions
```

The child should not need to type a legal document, phone number or complex password to study.

## Target UX

### Guardian

```text
Create account
  -> provide document
  -> provide phone
  -> validate phone
  -> create password
  -> create student profile
  -> optionally register trusted device
```

### Student

```text
Open Boom
  -> choose avatar/profile
  -> enter PIN
  -> start learning
```

### QR Approval

```text
Browser displays temporary QR code
Guardian scans with trusted mobile device
Guardian approves login
Browser receives session
Student starts learning
```

## Security Objectives

1. Prevent unauthorized access to student data.
2. Prevent brute force attacks on passwords and PINs.
3. Prevent user and document enumeration.
4. Prevent QR challenge reuse.
5. Prevent session theft.
6. Prevent mass assignment and over-posting.
7. Prevent expensive AI calls from unauthenticated or abusive clients.
8. Prevent API abuse from consuming OpenAI/AWS credits.
9. Prevent sensitive data from leaking into logs.
10. Ensure every security-sensitive decision is auditable.
