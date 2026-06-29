# Architecture - API-First Admin Interfaces

## Principle

Administrative UI must be a thin client over versioned APIs.

The backend owns:

- validation;
- normalization;
- policy enforcement;
- import lifecycle;
- auditability;
- signup invitation creation.

The frontend owns:

- interaction;
- layout;
- upload experience;
- preview rendering;
- error display.

## Architecture

```text
Admin UI
  -> API Gateway / Backend API
    -> Import Application Service
      -> Template Service
      -> Validation Service
      -> Staging Repository
      -> Domain Creation Service
      -> Signup Invitation Service
```

## Import Lifecycle

```text
Template Download
  -> File Upload
    -> Import Batch Created
      -> Row Parsing
        -> Normalization
          -> Validation
            -> Preview
              -> Confirmation
                -> Domain Records Created
                  -> Signup Invitations Created
```

## API Design

### Templates

```text
GET /api/v1/admin/import-templates/users
```

### Imports

```text
POST /api/v1/admin/imports/users
GET  /api/v1/admin/imports/{importBatchId}
GET  /api/v1/admin/imports/{importBatchId}/records
GET  /api/v1/admin/imports/{importBatchId}/errors
POST /api/v1/admin/imports/{importBatchId}/confirm
POST /api/v1/admin/imports/{importBatchId}/cancel
```

### Signup

```text
POST /api/v1/signup/start
POST /api/v1/signup/verify-email
POST /api/v1/signup/verify-phone
POST /api/v1/signup/create-pin
POST /api/v1/signup/activate
```

### Integrations

```text
POST /api/v1/integrations/users
POST /api/v1/integrations/students
POST /api/v1/integrations/guardians
POST /api/v1/integrations/enrollments
GET  /api/v1/integrations/import-status/{id}
```

## Validation Reuse

File import and direct API integration should call the same validation layer.

Bad:

```text
CSV validator
API validator
UI validator
```

Good:

```text
OnboardingValidationService
  -> used by CSV import
  -> used by API import
  -> used by UI preview
```

## Recommended File Format Strategy

### MVP

Use CSV for simplicity.

### Future

Add XLSX with multiple sheets:

```text
Users
Students
Guardians
Enrollments
Subjects
LearningGoals
```

## Security Considerations

- File uploads must have size limits.
- Unsupported file types must be rejected.
- Validation should not expose sensitive data.
- Document values should be normalized before hashing.
- Import confirmation should be auditable.
- Signup attempts should be rate-limited.
- Verification codes should expire.
- PIN should be hashed.
