# Story - AI-POC-002 - Student Coaching Agent Profile

## Title

Create individualized coaching agent configuration for each student.

## User Story

As the platform,
I want each student to have an active coaching agent profile,
so that AI-generated summaries, explanations and action plans are personalized, governed and auditable.

## Business Refinement

The coaching agent profile represents how the AI should behave for a specific student.

It should define:

- teaching methodology
- target country and school system
- preferred locale
- communication tone
- explanation depth
- AI provider/model
- hallucination policy
- grounding policy
- fallback behavior

The goal is not to expose all settings to the user immediately. The first goal is to centralize and govern AI behavior.

## Technical Refinement

Create a domain object:

```text
CoachingAgentProfile
```

Recommended package:

```text
com.boom.ai.coachingprofile.domain
```

Recommended related enums:

```text
TeachingMethod
LearningStrategy
CommunicationTone
ExplanationDepth
AiProvider
HallucinationPolicy
GroundingPolicy
SafetyPolicy
FallbackStrategy
CoachingAgentProfileStatus
```

The object should initially be a domain model, not necessarily a JPA entity.

## Acceptance Criteria

1. A student can have one active coaching agent profile.
2. The profile defines the preferred locale.
3. The profile defines the teaching method.
4. The profile defines the learning strategy.
5. The profile defines communication tone.
6. The profile defines explanation depth.
7. The profile defines AI provider and model.
8. The profile defines hallucination policy.
9. The profile defines grounding policy.
10. The profile defines fallback strategy.
11. The profile is versioned.
12. The profile status is explicit.
13. AI calls can reference which profile version was used.
14. The backend can create a safe default profile.
15. The model can exist before full persistence is implemented.

## Suggested Safe Defaults

```text
locale = en-US
teachingMethod = ADAPTIVE_DAILY_PRACTICE
learningStrategy = REMEDIATION_FIRST
communicationTone = ENCOURAGING
explanationDepth = STEP_BY_STEP
aiProvider = OPENAI
aiModel = configured outside domain
temperature = 0.2
hallucinationPolicy = STRICT
groundingPolicy = USE_PLATFORM_DATA_AND_CURRICULUM
safetyPolicy = EDUCATION_SAFE
fallbackStrategy = RULE_BASED_SUMMARY
status = ACTIVE
version = 1
```

## Out of Scope

- Prompt templates
- Real OpenAI integration
- Database migration
- Admin UI
- Student UI
- Runtime cost tracking
