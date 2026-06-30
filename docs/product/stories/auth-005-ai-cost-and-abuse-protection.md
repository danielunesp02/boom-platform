# Story - AUTH-005 - AI Cost and Abuse Protection

## User Story

As the platform owner,
I want AI calls to be protected by quotas, budgets and authorization,
so that attackers or bugs cannot drain OpenAI credits.

## Product Scope

AI generation must never be exposed as a simple public endpoint.

Every AI call must pass through:

```text
authorization
quota check
rate limit
cost classification
prompt size limit
provider timeout
fallback
audit log
```

## Backend Tasks

Create concepts:

```text
AiUsagePolicy
AiUsageQuota
AiRequestLog
AiCostClass
AiProviderCredentialReference
```

## API Rules

- No public AI generation endpoint.
- AI requires authenticated guardian/student context.
- AI requires student ownership check.
- AI requires active `CoachingAgentProfile`.
- AI request must declare use case.
- Prompt size must be capped.
- Output tokens must be capped.
- Repeated retries must use exponential backoff and max attempt cap.
- Provider timeout must be short and controlled.
- Fallback must work when AI is disabled.
- AI usage must be logged.
- Per-student and per-guardian quotas must exist.
- Global daily/monthly kill switch must exist.

## Feature Flags

```text
AI_ENABLED=false
AI_PROVIDER=openai
AI_DEFAULT_MODEL=configured-by-environment
AI_MAX_REQUESTS_PER_STUDENT_PER_DAY=20
AI_MAX_REQUESTS_PER_GUARDIAN_PER_DAY=50
AI_MAX_GLOBAL_REQUESTS_PER_DAY=200
AI_MAX_INPUT_TOKENS=4000
AI_MAX_OUTPUT_TOKENS=800
AI_COST_KILL_SWITCH=false
```

## Secrets

- OpenAI API key must never be committed to Git.
- API key must never be sent to frontend.
- API key must be stored as environment secret or AWS Secrets Manager.
- Use project-specific OpenAI API keys.
- Rotate compromised keys immediately.

## Infrastructure Tasks

- AWS Budget alerts.
- Optional AWS WAF rate-based rules for public routes.
- Application-level quotas for AI endpoints.
- CloudWatch alert for AI error spikes.
- CloudWatch alert for 429 spikes.
- CloudWatch alert for unexpected AI volume.
- OpenAI project usage dashboard monitoring.

## Frontend Tasks

- Do not call provider directly.
- Call only Boom backend.
- Show friendly fallback when AI unavailable.
- Do not allow infinite retry loops.
- Disable button during AI generation.
- Show clear "try again later" for quota/rate limit.
- Avoid sending unnecessary personal data to AI use cases.

## Acceptance Criteria

1. AI endpoint is not public.
2. AI request requires authenticated user.
3. AI request checks student ownership.
4. AI request checks quota.
5. AI request is rate limited.
6. Prompt and output limits are enforced.
7. OpenAI API key never reaches frontend.
8. AI usage is logged with profile id/version.
9. AI can be disabled globally.
10. Fallback works when provider fails.
