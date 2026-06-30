# OpenAI API Safety and Cost Controls

## Principle

OpenAI API usage must be backend-controlled.

The frontend must never receive:

```text
OpenAI API key
provider secret
raw provider credentials
```

## Project Setup

Recommended setup:

```text
OpenAI organization
  -> Project: boom-poc
    -> API key for backend only
    -> limited permissions where available
    -> low budget/prepaid credits
    -> usage dashboard monitoring
```

## Application Controls

Before calling OpenAI:

```text
check AI_ENABLED
check AI_COST_KILL_SWITCH
check authenticated subject
check student ownership
check CoachingAgentProfile
check rate limit
check quota
check prompt size
check output cap
```

## Suggested MVP Configuration

```text
AI_ENABLED=false
AI_COST_KILL_SWITCH=false
AI_PROVIDER=openai
AI_DEFAULT_MODEL=configured-by-environment
AI_MAX_GLOBAL_REQUESTS_PER_DAY=200
AI_MAX_REQUESTS_PER_STUDENT_PER_DAY=20
AI_MAX_REQUESTS_PER_GUARDIAN_PER_DAY=50
AI_MAX_INPUT_TOKENS=4000
AI_MAX_OUTPUT_TOKENS=800
AI_PROVIDER_TIMEOUT_SECONDS=20
AI_MAX_RETRIES=1
```

## Safe Defaults

For early Boom:

```text
Only parent summary and action plan use AI.
Activity generation remains disabled by default.
Fallback rule-based summary always exists.
```

## Secret Handling

Allowed:

```text
environment variable on dev
AWS Secrets Manager on cloud
manual local .env outside Git
```

Not allowed:

```text
committed API key
frontend environment variable
browser-exposed key
logs containing key
shared personal key across developers
```

## Emergency Procedure

```text
1. Set AI_COST_KILL_SWITCH=true
2. Disable external provider calls
3. Rotate OpenAI API key if needed
4. Review AiRequestLog
5. Identify abusive user/IP/device
6. Reduce quota
7. Patch endpoint
8. Re-enable gradually
```
