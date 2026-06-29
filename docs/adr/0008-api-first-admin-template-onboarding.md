# ADR-0008 - API-First Admin Interfaces and Template-Based Onboarding

## Status

Proposed

## Context

Boom needs to support administrative operations for families, schools, tutors and future external integrations.

If admin screens are implemented as large forms with UI-specific business logic, future integration will be harder and the product will become less flexible.

The product direction is to keep admin interfaces thin and componentized, while exposing APIs that can be reused by external systems.

## Decision

Boom will implement administrative onboarding using an API-first and template-driven approach.

Key decisions:

1. Admin UI will be thin and componentized.
2. Bulk onboarding will use downloadable templates.
3. Uploads will create import batches.
4. Data will be validated before final persistence.
5. Admin must preview and confirm imports.
6. The same validation service will support file imports and API integrations.
7. Signup will support activation using primary identity document, email verification, phone verification and PIN.
8. Identity documents will be modeled generically, not only as CPF.
9. Sensitive identity fields will be protected using hashing/encryption/masking strategies.

## Consequences

### Positive

- Easier future integration.
- Better school onboarding.
- Less UI complexity.
- More reusable backend services.
- Safer import process.
- Stronger auditability.
- Global readiness for different countries/documents.

### Trade-offs

- More backend design upfront.
- Import lifecycle is more complex than direct CRUD.
- Requires careful validation and error handling.
- Requires security decisions for documents and PIN.
- Requires clear template versioning.

## Alternatives Considered

### Large Admin Forms

Rejected because they create high UI complexity and poor integration readiness.

### Direct Database Import

Rejected because it bypasses validation, audit and business rules.

### CPF-Only Signup

Rejected because Boom should support international usage and country-specific documents.

## Follow-up Decisions

Future ADRs may be needed for:

- authentication/authorization model;
- encryption strategy;
- integration client security;
- event/webhook model;
- XLSX template format.
