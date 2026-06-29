# User Stories - API-First Admin and Template Onboarding

## Epic ADM - API-First Administration

### ADM-001 - Download user import template

As an admin,
I want to download a user import template,
so that I can prepare user data offline before uploading it.

Acceptance criteria:

- Admin can request the latest user import template.
- Template contains required and optional columns.
- Template includes examples or column descriptions.
- Template version is identifiable.
- API returns the template without requiring UI-only logic.

Priority: P0

---

### ADM-002 - Upload user import file

As an admin,
I want to upload a completed user import file,
so that Boom can validate users before creating accounts.

Acceptance criteria:

- Admin can upload a CSV file.
- System creates an import batch.
- System stores original file metadata.
- System does not create final users immediately.
- System returns import batch id.

Priority: P0

---

### ADM-003 - Validate imported records

As an admin,
I want Boom to validate the uploaded file,
so that I can correct errors before confirming the import.

Acceptance criteria:

- System validates required fields.
- System validates email format.
- System validates phone format.
- System validates document type and country.
- System validates duplicate records inside the file.
- System validates conflicts with existing records.
- System returns errors by row and column.

Priority: P0

---

### ADM-004 - Preview valid import records

As an admin,
I want to preview valid imported records,
so that I can confirm the import safely.

Acceptance criteria:

- Admin can view valid records before confirmation.
- Sensitive fields are masked where appropriate.
- Records show target entity type.
- Records show warnings if applicable.
- No final persistence happens before confirmation.

Priority: P0

---

### ADM-005 - Confirm import batch

As an admin,
I want to confirm an import batch,
so that validated users, students and guardians are created.

Acceptance criteria:

- Only validated records can be confirmed.
- System creates final domain records.
- System creates signup invitations where needed.
- Import status changes to confirmed.
- Operation is auditable.

Priority: P0

---

### ADM-006 - View import history

As an admin,
I want to see previous imports,
so that I can audit onboarding operations.

Acceptance criteria:

- Admin can list import batches.
- Each batch shows status, creator, created date and summary.
- Admin can view validation results.
- Admin can view confirmation status.

Priority: P1

---

### ADM-007 - Expose integration endpoint for users

As an external system,
I want to create users through an API,
so that I can integrate Boom with school or partner systems.

Acceptance criteria:

- API accepts user payload equivalent to template fields.
- API applies the same validation rules as file import.
- API returns clear validation errors.
- API is versioned.
- API is ready for future authentication/credentials.

Priority: P1
