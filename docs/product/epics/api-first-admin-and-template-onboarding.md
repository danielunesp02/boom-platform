# Epic - API-First Admin and Template-Based Onboarding

## Goal

Create thin, componentized administrative interfaces built on top of public/internal APIs, enabling both manual admin operations and future integration with external systems.

The admin experience should avoid large forms when bulk configuration is more appropriate. Instead, the admin should be able to download a template, fill it, upload it, validate the data, preview the result and confirm the import.

## Product Rationale

Boom may be used by:

- families;
- schools;
- tutors;
- education groups;
- future partner systems;
- external school management systems.

Because of this, core administrative operations should not be tightly coupled to the UI. The UI should be one consumer of the API, not the only execution path.

## Guiding Principle

```text
API first
UI second
Template as one input option
Integration-ready by design
```

## Main Capabilities

1. Download import templates.
2. Upload completed templates.
3. Validate files before persistence.
4. Show errors and warnings.
5. Preview valid records.
6. Confirm import.
7. Create users, students, guardians and enrollments.
8. Generate signup invitations.
9. Allow future external systems to create the same data through APIs.
10. Keep admin screens thin and reusable.

## User Types

### Admin

Needs to onboard users quickly without filling large forms.

### School Admin

Needs to import many students, guardians and enrollments from existing school records.

### Guardian

May receive a signup invitation after being pre-registered.

### Student

May activate an account using a primary identity document, email/phone validation and PIN.

### External System

May integrate through exposed APIs instead of using the UI.

## MVP Scope

The MVP should support:

- user import template download;
- CSV upload;
- validation pipeline;
- import preview;
- import confirmation;
- creation of pending users/students/guardians;
- signup invitation creation;
- basic signup activation flow.

## Out of Scope for MVP

- Complex XLSX multi-sheet templates.
- Fully automated school SIS integration.
- OAuth/OIDC identity federation.
- Advanced RBAC.
- Paid integration marketplace.
- Real-time webhook delivery.
