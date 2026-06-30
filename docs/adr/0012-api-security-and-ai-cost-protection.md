# ADR-0012 - API Security and AI Cost Protection

## Status

Proposed

## Context

Boom will expose APIs for authentication, parent dashboards, student learning, AI-generated summaries and future school integrations.

AI calls create financial risk because an attacker or bug could consume provider credits.

APIs also expose sensitive student and guardian data.

## Decision

Boom will treat API security and AI cost protection as first-class architecture concerns.

Every endpoint must define:

```text
classification
auth requirement
authorization rule
rate limit
audit event
sensitive logging policy
AI cost class when applicable
```

AI calls must use:

```text
auth
authorization
quota
rate limit
prompt size limit
output limit
timeout
retry cap
fallback
usage log
kill switch
```

## Rules

1. No public AI generation endpoint.
2. OpenAI API key must never reach frontend.
3. AI must have global kill switch.
4. AI must have per-student and per-guardian quotas.
5. API endpoints are deny-by-default.
6. Object ownership checks are mandatory.
7. Sensitive values must be redacted from logs.
