# Threat Model - Authentication and AI Cost Abuse

## Assets

```text
student learning history
guardian identity data
identity documents
phone numbers
sessions
student PINs
trusted devices
QR login challenges
OpenAI API key
AI credits
AWS infrastructure cost
```

## Threats and Controls

| Threat | Impact | Control |
|---|---|---|
| Brute force guardian password | Account takeover | rate limit, lockout, generic errors, audit |
| Brute force student PIN | Unauthorized student access | PIN rate limit, lockout, guardian reset |
| User enumeration | Privacy leak | generic errors, normalized responses |
| Document enumeration | Sensitive identity leak | generic errors, document hash, no raw exposure |
| Broken object authorization | Cross-student data access | ownership checks on every student object |
| Mass assignment | Privilege/data modification | DTO allowlist, server-side field control |
| QR replay | Unauthorized login | one-time challenge, expiration, consume state |
| QR token leakage | Session takeover | QR contains challenge only, no session token |
| Device theft | Unauthorized approvals | device revocation, session expiration |
| Public AI endpoint abuse | Credit drain | auth, quota, rate limit, kill switch |
| Prompt flooding | Cost spike | input token cap, output cap, request size cap |
| Retry storm | Cost/traffic spike | retry cap, exponential backoff, circuit breaker |
| Secret leakage | Provider compromise | no secrets in Git/frontend/logs, rotation |
| Excessive logging | Privacy leak | redaction and safe logging policy |
| Infrastructure abuse | AWS bill spike | WAF/rate limits/budgets/alerts |

## Minimum MVP Security Bar

Boom MVP should not go live unless:

```text
auth is rate limited
student data has ownership checks
AI endpoint is protected by quota
OpenAI key is not in frontend
raw documents are not exposed
sessions are revocable
QR challenges are temporary and single-use
```
