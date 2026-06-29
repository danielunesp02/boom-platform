# BDD Test Strategy - Learning History and Parent Dashboard

## Goal

Define a small number of high-value automated acceptance tests using Gherkin.

The objective is quality, not quantity.

## Test Philosophy

The test suite should protect business-critical invariants:

1. Learning history is preserved.
2. Completed attempts and answer submissions are immutable.
3. Evidence is generated with subject/topic/skill context.
4. Gaps are detected and updated without duplication.
5. Time spent working on a gap is measurable.
6. Outcome summaries are generated after each delivery.
7. Action plans are created or updated based on gaps.
8. Parent dashboard is read-only.
9. Parent can only access linked student data.
10. Aggregates can be recalculated from raw history.

## Recommended Test Layers

### BDD Acceptance Tests

Use for end-to-end business behavior.

Examples:

- completing an activity creates history, evidence, summary and plan;
- repeated weak performance updates a gap;
- parent dashboard shows only linked student data.

### Integration Tests

Use for database persistence and service collaboration.

Examples:

- answer immutability after attempt completion;
- evidence generation idempotency;
- gap update without duplication.

### Unit Tests

Use for pure calculation rules.

Examples:

- accuracy calculation;
- severity calculation;
- trend calculation;
- duration calculation.

## What Not to Test Excessively

Avoid writing many low-value tests for:

- getters/setters;
- trivial DTO mappings;
- framework behavior;
- simple controller wiring if already covered by integration tests;
- UI snapshots for every card variation in early MVP.

## High-Value Test Criteria

A test is worth writing when it protects one of these:

- money/value;
- data integrity;
- privacy/access control;
- learning analytics correctness;
- irreversible workflow;
- policy enforcement;
- user trust.
