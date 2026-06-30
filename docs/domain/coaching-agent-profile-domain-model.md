# Coaching Agent Profile Domain Model

## Overview

The `CoachingAgentProfile` is the individualized configuration that tells Boom how the AI coaching layer should behave for one student.

It is not the same as a user preference.

A user preference may include:

- language
- theme
- notification preference

A coaching agent profile includes:

- pedagogy
- AI behavior
- grounding rules
- safety rules
- model/provider configuration
- fallback strategy

## Relationships

Recommended future model:

```text
Student
  -> StudentLearningProfile
  -> CoachingAgentProfile
      -> AiRuntimeConfiguration
      -> PromptTemplate
      -> AiRequestLog
```

## Core Object

### CoachingAgentProfile

Fields:

```text
id
studentId
locale
targetCountry
targetSchoolSystem
teachingMethod
learningStrategy
communicationTone
explanationDepth
aiProvider
aiModel
temperature
maxTokens
hallucinationPolicy
groundingPolicy
safetyPolicy
fallbackStrategy
status
version
createdAt
updatedAt
activatedAt
replacedAt
```

## Key Invariants

1. A student should have at most one active coaching profile.
2. A profile version should not be silently overwritten.
3. AI calls should log the profile id and version used.
4. API keys must not be stored in the profile.
5. Defaults must be safe for educational use.
6. The profile should support future provider switching.
7. The profile should support future anti-hallucination policies.

## Anti-Hallucination Default

For education, the default should be:

```text
hallucinationPolicy = STRICT
groundingPolicy = USE_PLATFORM_DATA_AND_CURRICULUM
```

The agent should be instructed to:

```text
Use only the provided activity, answers, gaps, curriculum and learning history.
If the evidence is insufficient, say that there is not enough data.
Do not invent performance, diagnosis, history or unsupported recommendations.
```
