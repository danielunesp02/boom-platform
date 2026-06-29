# Sprint 6 - API-First Admin Onboarding

## Goal

Create the first backend foundation for template-based onboarding.

## Scope

1. ImportTemplate model.
2. ImportBatch model.
3. ImportRecord model.
4. ImportValidationError model.
5. User import template download.
6. CSV user import upload.
7. Row parsing and normalization.
8. Validation result endpoint.
9. Import preview endpoint.
10. Import confirmation endpoint.

## Acceptance Criteria

- Admin can download a CSV user import template.
- Admin can upload a completed CSV file.
- Upload creates an import batch.
- System validates required fields.
- System returns validation errors by row/column.
- Admin can preview normalized valid records.
- Admin can confirm a valid import.
- Confirmed import creates pending users/students/guardians.
- Import status is persisted.
- No signup activation yet.

## Out of Scope

- Email sending.
- SMS sending.
- PIN creation.
- External integration credentials.
- Frontend implementation.
- XLSX support.
