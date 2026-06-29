# Epic - Componentized Admin UI

## Goal

Build lean administrative screens that are easy to maintain, reuse and integrate.

The UI should not contain business rules that are unavailable to the API.

## Product Rationale

Admin screens can become complex very quickly if every entity gets a large form. For Boom, many admin operations are better represented as:

- template download;
- file upload;
- validation;
- preview;
- confirmation;
- history;
- retry.

This makes the UI simpler and prepares the platform for external integrations.

## UI Principles

1. Thin UI.
2. API-driven behavior.
3. Reusable import components.
4. Minimal form usage.
5. Validation feedback from backend.
6. Preview before commit.
7. Import history visible to admin.
8. Clear error messages.
9. Strong accessibility baseline.
10. No hidden UI-only business logic.

## Reusable Components

```text
ImportTypeSelector
TemplateDownloadButton
FileUploadDropzone
ImportValidationSummary
ImportErrorTable
ImportPreviewTable
ImportConfirmationPanel
ImportHistoryTable
ImportStatusBadge
```

## MVP Admin Screen

The first admin screen should support user onboarding.

Screen sections:

1. Import type.
2. Template download.
3. Upload area.
4. Validation status.
5. Error table.
6. Preview table.
7. Confirm import.
8. Import history.

## Future Screens

The same component model should support:

- subject import;
- curriculum import;
- learning objective import;
- student enrollment import;
- guardian relationship import;
- teaching method import;
- gamification rules import.
