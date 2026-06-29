# User Stories - Componentized Admin UI

## Epic UIA - Componentized Admin UI

### UIA-001 - Use reusable import page shell

As a developer,
I want a reusable import page shell,
so that different admin imports share the same UX pattern.

Acceptance criteria:

- Shell supports title, description and import type.
- Shell includes template download area.
- Shell includes upload area.
- Shell includes validation and preview states.
- Shell can be reused for users, subjects and enrollments.

Priority: P1

---

### UIA-002 - Show validation result table

As an admin,
I want to see validation errors in a table,
so that I can correct the source file quickly.

Acceptance criteria:

- Table shows row number.
- Table shows column name.
- Table shows error message.
- Table supports warnings and blocking errors.
- Table can export errors later.

Priority: P0

---

### UIA-003 - Show import preview table

As an admin,
I want to preview records before confirmation,
so that I can avoid importing incorrect data.

Acceptance criteria:

- Table shows normalized data.
- Sensitive data is masked.
- Admin can see entity type and status.
- Preview is read-only.
- Confirm action is disabled if blocking errors exist.

Priority: P0

---

### UIA-004 - Show import status

As an admin,
I want to see the import status,
so that I know whether the import is pending, invalid, valid, confirmed or failed.

Acceptance criteria:

- Status is visible after upload.
- Status updates after validation.
- Status updates after confirmation.
- Failed imports show recoverable error information.

Priority: P1
