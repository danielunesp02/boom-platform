# API Security Checklist

## Endpoint Classification

Every endpoint must define:

```text
classification
authentication required
roles allowed
ownership rule
rate limit policy
audit event
sensitive fields
AI cost class if applicable
```

## Authentication

- [ ] Public endpoints are explicitly listed.
- [ ] All other endpoints require authentication.
- [ ] Passwords are hashed with an adaptive algorithm.
- [ ] PINs are hashed.
- [ ] Login errors are generic.
- [ ] Auth attempts are rate limited.
- [ ] Sessions can be revoked.
- [ ] Session cookies are HTTP-only.
- [ ] Session cookies are Secure in cloud.
- [ ] Tokens are not stored in localStorage.

## Authorization

- [ ] Deny-by-default is applied.
- [ ] Object ownership is checked for every student-specific endpoint.
- [ ] Guardian must be linked to student.
- [ ] Student session cannot call guardian endpoints.
- [ ] Admin endpoints require admin role.
- [ ] No endpoint trusts IDs without ownership verification.

## Data Protection

- [ ] Passwords are never logged.
- [ ] PINs are never logged.
- [ ] Raw document number is never logged.
- [ ] Full phone number is never logged.
- [ ] Authorization header is never logged.
- [ ] OpenAI API key is never logged.
- [ ] Sensitive response fields are minimized.
- [ ] DTOs prevent mass assignment.

## Rate Limiting

- [ ] Signup rate limited.
- [ ] Login rate limited.
- [ ] Phone verification rate limited.
- [ ] PIN login rate limited.
- [ ] QR polling rate limited.
- [ ] QR approval rate limited.
- [ ] AI endpoints rate limited.

## AI Cost Protection

- [ ] AI endpoint is not public.
- [ ] AI requires authorization.
- [ ] AI checks student ownership.
- [ ] AI checks quota.
- [ ] AI has input size cap.
- [ ] AI has output token cap.
- [ ] AI has timeout.
- [ ] AI has retry cap.
- [ ] AI has fallback.
- [ ] AI has global kill switch.
- [ ] AI usage is logged.
- [ ] OpenAI key is backend-only.
