# Prioritized Backlog - Learning History and Parent Dashboard

## P0 - Must Have

| ID | Story | Reason |
|---|---|---|
| LH-001 | Persist assessment attempt | Historical source of truth |
| LH-002 | Persist answer submissions | Answer-level performance analysis |
| LH-003 | Generate learning evidence | Analytics foundation |
| LH-004 | Detect learning gaps | Main learning intelligence capability |
| LH-005 | Generate activity outcome summary | Parent-friendly delivery summary |
| LH-006 | Create/update learning action plan | Turns data into next steps |
| PD-001 | View parent dashboard | Parent value surface |
| PD-003 | View activity history chart | Shows frequency and consistency |
| PD-004 | View subject performance | Shows where student is strong/weak |
| PD-005 | View learning gaps | Shows attention areas |
| PD-006 | View current action plan | Shows what to do next |

## P1 - Should Have

| ID | Story | Reason |
|---|---|---|
| LH-007 | Generate daily learning summary | Faster dashboard queries |
| PD-002 | Select student | Multi-child family support |
| PD-007 | View recent activity timeline | Better parent understanding |

## P2 - Could Have

| ID | Story | Reason |
|---|---|---|
| LH-008 | Generate subject performance snapshot | Performance optimization |
| LH-009 | Generate skill mastery snapshot | Future AI/gamification |
| PD-008 | Export dashboard summary | Parent/tutor sharing |

## Recommended Sequence

```text
1. Learning history tables and services
2. Evidence generation
3. Gap detection
4. Outcome summary
5. Action plan
6. Parent dashboard API
7. React Web dashboard
```

## Implementation Notes

Do not build dashboard UI before the backend can produce meaningful history and summaries.

Do not implement AI explanations before evidence, gaps and action plans exist.

Do not implement gamification before events and evidence are reliable.
