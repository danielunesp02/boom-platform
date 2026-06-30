# Backlog - AI Coaching Agent Profile

## P0

| ID | Story | Reason |
|---|---|---|
| AI-POC-002 | Student Coaching Agent Profile | Centralizes individualized AI behavior |
| AI-POC-003 | Safe default coaching profile | Allows AI features without full admin UI |
| AI-POC-004 | AI call references profile version | Enables auditability |

## P1

| ID | Story | Reason |
|---|---|---|
| AI-POC-005 | Coaching profile persistence | Required after Student model exists |
| AI-POC-006 | Rule-based fallback strategy | Required for resilience |
| AI-POC-007 | Prompt template linked to profile | Enables consistent generation |

## P2

| ID | Story | Reason |
|---|---|---|
| AI-POC-008 | Admin configuration UI | Needed for schools/institutions |
| AI-POC-009 | Provider switching policy | Needed for cost and model flexibility |
| AI-POC-010 | Hallucination policy evaluation | Needed for quality control |

## Recommended Sequence

```text
1. Define domain object and docs.
2. Add safe default factory.
3. Link AI request log to profile id/version.
4. Add persistence after student model exists.
5. Add admin-controlled configuration later.
```
