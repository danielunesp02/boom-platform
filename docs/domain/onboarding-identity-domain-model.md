# Onboarding and Identity Domain Model

## Bounded Context

Recommended location:

```text
platform.onboarding
platform.identity
platform.integration
```

## Core Objects

### ImportTemplate

Represents a downloadable template definition.

Fields:

- id
- code
- version
- entityType
- fileFormat
- requiredColumns
- optionalColumns
- description
- isActive
- createdAt
- updatedAt

### ImportBatch

Represents one uploaded file and its validation/import lifecycle.

Fields:

- id
- tenantId
- organizationId
- templateId
- originalFileName
- fileHash
- status
- totalRecords
- validRecords
- invalidRecords
- warningRecords
- createdByUserId
- confirmedByUserId
- createdAt
- confirmedAt

Possible status values:

- UPLOADED
- VALIDATING
- VALID
- INVALID
- CONFIRMED
- FAILED
- CANCELLED

### ImportRecord

Represents a single row inside an import batch.

Fields:

- id
- importBatchId
- rowNumber
- rawPayload
- normalizedPayload
- targetEntityType
- status
- createdEntityId
- createdAt

Possible status values:

- PENDING
- VALID
- INVALID
- IMPORTED
- SKIPPED

### ImportValidationError

Represents one validation error for one imported record.

Fields:

- id
- importBatchId
- importRecordId
- rowNumber
- columnName
- severity
- errorCode
- message
- createdAt

Possible severity values:

- WARNING
- ERROR
- BLOCKER

### SignupInvitation

Represents a pending account activation invitation.

Fields:

- id
- tenantId
- userId
- invitationTokenHash
- status
- expiresAt
- activatedAt
- createdAt
- updatedAt

Possible status values:

- PENDING
- ACTIVE
- EXPIRED
- CANCELLED
- USED

### IdentityDocument

Represents a country-specific identity document.

Fields:

- id
- userId
- countryCode
- documentType
- documentValueEncrypted
- documentValueHash
- documentLastDigits
- isPrimary
- verifiedAt
- createdAt
- updatedAt

### ContactChannel

Represents a user's email or phone.

Fields:

- id
- userId
- channelType
- valueEncrypted
- valueHash
- displayMaskedValue
- isPrimary
- verifiedAt
- createdAt
- updatedAt

Possible channel types:

- EMAIL
- PHONE

### VerificationChallenge

Represents an email/phone verification attempt.

Fields:

- id
- userId
- contactChannelId
- channelType
- purpose
- codeHash
- status
- expiresAt
- attempts
- createdAt
- verifiedAt

Possible purposes:

- SIGNUP_EMAIL_VERIFICATION
- SIGNUP_PHONE_VERIFICATION
- PASSWORD_RESET
- CONTACT_CHANGE

### PinCredential

Represents a user's PIN credential.

Fields:

- id
- userId
- pinHash
- status
- createdAt
- updatedAt
- lastUsedAt

Possible status values:

- ACTIVE
- LOCKED
- RESET_REQUIRED
- DISABLED

### ExternalIntegrationClient

Represents an external system allowed to call Boom APIs.

Fields:

- id
- tenantId
- organizationId
- name
- status
- allowedScopes
- createdAt
- updatedAt

### ApiCredential

Represents credentials for an external integration client.

Fields:

- id
- integrationClientId
- credentialType
- credentialHash
- status
- expiresAt
- createdAt
- revokedAt

## Important Design Notes

- Import should be staged before final persistence.
- Template upload and API integration should reuse the same validation service.
- Document lookup should use hash, not plain text.
- Display should use masked values.
- PIN should be treated as a credential, never as plain application data.
