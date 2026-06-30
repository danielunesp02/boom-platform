# Epic - Student Coaching Agent Profile

## Goal

Create a per-student, versioned and auditable configuration object that defines how computational coaching agents should behave for each learner.

This object allows Boom to personalize AI behavior without hardcoding prompts, models or methodology decisions in controllers or isolated services.

## Business Rationale

Boom should not use AI as a generic chatbot.

Each learner may need a different coaching strategy depending on:

- age
- current school level
- target country/school system
- learning goals
- preferred language
- teaching methodology
- learning gaps
- confidence level
- parent/school policies
- safety requirements
- allowed AI provider/model

A personalized coaching profile allows Boom to use AI in a controlled, individualized and auditable way.

## Core Idea

```text
Student
  -> LearningProfile
  -> CoachingAgentProfile
  -> AiRuntimeConfiguration
  -> AiGateway
  -> Provider Adapter
```

Whenever Boom needs AI assistance, it should first resolve the student's active `CoachingAgentProfile`.

Examples:

- generate parent-friendly outcome summary
- generate action plan
- explain a wrong answer
- suggest remediation
- generate practice questions
- adapt tone/depth to the learner
- restrict unsupported claims
- switch provider/model safely

## Why It Matters

Without this object, AI behavior becomes scattered:

```text
Controller -> hardcoded prompt -> OpenAI
```

With this object, AI behavior becomes governed:

```text
Education event
  -> CoachingAgentProfile
  -> PromptTemplate
  -> AiGateway
  -> Provider
  -> Audit log
```

## Product Principles

1. AI must be individualized.
2. AI must be configurable.
3. AI must be auditable.
4. AI must be replaceable.
5. AI must have safe defaults.
6. AI should not invent student history.
7. AI should use platform evidence whenever available.
8. AI behavior should be versioned over time.

## MVP Scope

The MVP should define:

- one active coaching profile per student
- teaching method
- target school/country context
- communication tone
- explanation depth
- locale
- AI provider
- AI model
- hallucination policy
- grounding policy
- fallback strategy
- version
- status

## Out of Scope for MVP

- Full AI execution
- Prompt management UI
- Multi-agent orchestration
- Real provider switching UI
- Model evaluation dashboard
- Teacher review workflow
- Database persistence until the student model is stable
