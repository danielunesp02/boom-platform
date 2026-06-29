# Prioritized Product Backlog

## Prioritization Method

This backlog uses a simple product priority model:

- P0: foundational, needed before meaningful product usage;
- P1: important, supports near-term usability and integration;
- P2: valuable, can wait until the core loop is validated;
- P3: future differentiation or scale feature.

## Current Recommended Order

```text
Sprint 4 - Education foundation
Sprint 5 - Configurable learning profile
Sprint 6 - API-first admin onboarding
Sprint 7 - Signup and identity verification
Sprint 8 - Gamification foundation
Sprint 9 - AI-assisted activity generation
Sprint 10 - Dashboard and learning analytics
```

## P0 - Foundation

| ID | Item | Type | Reason |
|---|---|---|---|
| EDU-001 | Student entity | Story | Needed for any learning flow |
| EDU-002 | Subject entity | Story | Needed to organize learning |
| EDU-003 | Curriculum framework entity | Story | Needed for flexible curriculum mapping |
| EDU-004 | Learning objective entity | Story | Needed for measurable learning |
| CLP-001 | Student learning profile | Story | Needed for personalized learning |
| CLP-002 | Teaching method catalog | Story | Needed for flexible methodology |
| CLP-003 | Subject enrollment | Story | Needed for student-specific subjects |
| CLP-004 | Learning policy | Story | Needed for admin-controlled freedom |
| ADM-001 | Download user import template | Story | Needed for admin onboarding |
| ADM-002 | Upload user import file | Story | Needed for bulk onboarding |
| ADM-003 | Validate imported records | Story | Needed for safe onboarding |
| ADM-004 | Preview valid import records | Story | Needed before confirmation |
| ADM-005 | Confirm import batch | Story | Needed to create pending users |
| SIG-001 | Start signup with primary document | Story | Needed for account activation |
| SIG-002 | Verify email | Story | Needed for identity verification |
| SIG-003 | Verify phone | Story | Needed for identity verification |
| SIG-004 | Create PIN | Story | Needed for account activation |

## P1 - Near-Term Product

| ID | Item | Type | Reason |
|---|---|---|---|
| ADM-006 | View import history | Story | Needed for admin auditability |
| ADM-007 | Expose integration endpoint for users | Story | Supports future system integration |
| SIG-005 | Mask contact information during signup | Story | Improves security and UX |
| SIG-006 | Expire stale signup invitations | Story | Improves security |
| UIA-001 | Reusable import page shell | Story | Frontend reuse |
| UIA-002 | Validation result table | Story | Admin usability |
| UIA-003 | Import preview table | Story | Admin usability |
| UIA-004 | Import status component | Story | Admin usability |
| GAM-001 | Gamification profile | Story | Engagement foundation |
| GAM-002 | Points transaction ledger | Story | Reliable points model |
| GAM-003 | Daily streak | Story | Engagement loop |
| GAM-004 | Avatar profile | Story | Student identity |

## P2 - Differentiation

| ID | Item | Type | Reason |
|---|---|---|---|
| GAM-005 | Achievements | Story | Motivational layer |
| GAM-006 | Reward rules | Story | Configurable gamification |
| AI-001 | AI activity generation | Story | Product differentiation |
| AI-002 | AI explanation generation | Story | Personalized feedback |
| ANA-001 | Daily learning summary | Story | Guardian visibility |
| ANA-002 | Skill gap signals | Story | Adaptive learning |

## P3 - Future Scale

| ID | Item | Type | Reason |
|---|---|---|---|
| INT-001 | Integration client credentials | Story | External ecosystem |
| INT-002 | Webhook delivery | Story | Partner integrations |
| ADM-008 | XLSX multi-sheet import | Story | Advanced school onboarding |
| GAM-007 | RPG learning map | Story | Engagement differentiation |
| GAM-008 | Team-based leaderboards | Story | Optional school engagement |
| AUTH-001 | SSO/OIDC | Story | Enterprise/school readiness |

## Backlog Notes

- Do not implement gamification before student/activity foundations.
- Do not implement AI before metadata and learning objectives are stable.
- Do not implement complex frontend before API contracts are validated.
- Do not implement external integrations before import validation is reusable.
