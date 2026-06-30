# Architecture - Coaching Agent Profile

## Principle

AI behavior must be configured and governed before provider execution.

Bad:

```text
Controller -> prompt string -> OpenAI
```

Good:

```text
Application use case
  -> CoachingAgentProfileResolver
  -> PromptTemplate
  -> AiGateway
  -> ProviderAdapter
  -> AiRequestLog
```

## Runtime Flow

```text
Activity completed
  -> OutcomeSummaryUseCase
    -> Load Student
    -> Resolve active CoachingAgentProfile
    -> Build structured AI input
    -> Select PromptTemplate
    -> Call AiGateway
    -> Provider Adapter
    -> Persist AiRequestLog/AiResponseLog
    -> Persist ActivityOutcomeSummary
```

## Main Components

### CoachingAgentProfileResolver

Responsibilities:

- find active profile for a student
- create safe default profile when none exists
- enforce one-active-profile rule
- return profile id/version for audit

### AiGateway

Responsibilities:

- execute provider-agnostic AI calls
- apply provider configuration
- handle timeout/retry/fallback
- produce normalized response

### PromptTemplateService

Responsibilities:

- provide prompt templates by use case
- version prompt templates
- compose prompt with structured input

### AiRequestLogService

Responsibilities:

- record request metadata
- record provider/model/profile version
- record token usage/cost later
- support audit and debugging

## Feature Flags

AI should be controlled by:

```text
AI_ENABLED
AI_PROVIDER
AI_DEFAULT_MODEL
```

If AI is disabled:

```text
fallbackStrategy = RULE_BASED_SUMMARY
```

## Security

- API keys must be stored outside the domain model.
- API keys must not be committed to Git.
- Provider credentials should come from environment variables or secrets.
- Student context sent to providers should be minimized.
- AI calls should be logged without leaking sensitive secrets.
