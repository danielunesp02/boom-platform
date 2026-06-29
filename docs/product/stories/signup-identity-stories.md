# User Stories - Signup and Identity Verification

## Epic SIG - Signup and Identity Verification

### SIG-001 - Start signup with primary document

As a pre-registered user,
I want to start signup using my primary document,
so that Boom can find my pending account.

Acceptance criteria:

- User can submit country, document type and document value.
- System normalizes document value.
- System searches by secure document hash.
- If found, system starts signup session.
- Response does not expose sensitive user data.

Priority: P0

---

### SIG-002 - Verify email

As a pre-registered user,
I want to verify my email,
so that Boom can confirm that I own the registered email address.

Acceptance criteria:

- System sends a verification code to registered email.
- Code expires after a configured time.
- User can submit the verification code.
- System marks email as verified.
- Failed attempts are rate-limited.

Priority: P0

---

### SIG-003 - Verify phone

As a pre-registered user,
I want to verify my phone number,
so that Boom can confirm that I own the registered phone contact.

Acceptance criteria:

- System sends a verification code to registered phone.
- Phone can support SMS or future WhatsApp delivery.
- Code expires after a configured time.
- User can submit the verification code.
- Failed attempts are rate-limited.

Priority: P0

---

### SIG-004 - Create PIN

As a verified user,
I want to create a PIN,
so that I can activate and access my account.

Acceptance criteria:

- User can create a PIN only after required verifications.
- PIN is never stored in plain text.
- PIN must satisfy basic security rules.
- Account is activated after successful PIN creation.
- Activation event is audited.

Priority: P0

---

### SIG-005 - Mask contact information during signup

As a pre-registered user,
I want to see masked contact hints,
so that I can recognize my email/phone without exposing private data.

Acceptance criteria:

- System can show masked email.
- System can show masked phone.
- Full values are not exposed.
- Masking rules are consistent.

Priority: P1

---

### SIG-006 - Expire stale signup invitations

As an admin,
I want signup invitations to expire,
so that old pending accounts do not remain active forever.

Acceptance criteria:

- Invitation has expiration date.
- Expired invitations cannot be used.
- Admin can reissue invitation.
- Expiration is visible in admin history.

Priority: P1
