# Sprint 9 - Parent Dashboard API

## Goal

Expose read-only APIs for parent/guardian dashboard.

## Scope

1. Guardian-student relationship access check.
2. Parent dashboard endpoint.
3. Activity history endpoint.
4. Subject performance endpoint.
5. Learning gaps endpoint.
6. Current action plan endpoint.
7. Recent activity summaries endpoint.
8. Empty state responses.
9. BDD scenarios for access and read-only behavior.

## Acceptance Criteria

- Parent can view dashboard only for linked students.
- Parent cannot view unlinked students.
- Dashboard response contains weekly summary.
- Dashboard response contains activity history.
- Dashboard response contains subject performance.
- Dashboard response contains active gaps.
- Dashboard response contains current action plan.
- Dashboard is read-only.
- Empty states are handled gracefully.

## Out of Scope

- Frontend implementation.
- Export reports.
- Push notifications.
- Gamification UI.
