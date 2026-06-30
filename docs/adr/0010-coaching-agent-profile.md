# ADR-0010 - Coaching Agent Profile

## Status

Proposed

## Context

Boom will use AI to generate explanations, summaries, action plans and potentially adaptive learning content.

Using AI directly from controllers or services with hardcoded prompts would create several problems:

- inconsistent behavior
- difficult provider switching
- weak auditability
- poor hallucination control
- no individualized learning configuration
- hard-to-debug AI outputs

Boom needs a configuration object that defines how the AI should behave for each student.

## Decision

Boom will introduce `CoachingAgentProfile` as a per-student, versioned and auditable domain object.

The profile defines:

- locale
- target country
- target school system
- teaching method
- learning strategy
- communication tone
- explanation depth
- AI provider
- AI model
- temperature
- max tokens
- hallucination policy
- grounding policy
- safety policy
- fallback strategy
- status
- version

AI calls must reference the active profile used at generation time.

## Consequences

### Positive

- Personalized AI behavior
- Safer educational AI
- Better hallucination control
- Easier provider switching
- Better auditability
- Clear separation between education domain and AI provider
- Supports future school/admin policies

### Trade-offs

- More configuration complexity
- Requires default profile strategy
- Requires versioning discipline
- Requires audit links from AI requests to profile versions
- Requires careful UI later

## Rules

1. Do not store API keys in `CoachingAgentProfile`.
2. Do not hardcode provider behavior in controllers.
3. Do not silently overwrite profile versions.
4. Do log profile id/version in AI request logs.
5. Do default to strict grounding for student learning analytics.
6. Do provide rule-based fallback when AI is disabled or unavailable.
