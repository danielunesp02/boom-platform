# Database Model Draft - API-First Onboarding

## Candidate Tables

```text
import_template
import_batch
import_record
import_validation_error
signup_invitation
identity_document
contact_channel
verification_challenge
pin_credential
external_integration_client
api_credential
```

## Important Notes

- Use UUID primary keys.
- Import records should be staged.
- Import confirmation should be idempotent where possible.
- Document lookup should use hash.
- Document display should use masking.
- Verification codes should be hashed.
- PIN should be hashed.
- Sensitive values may require encryption.
- Import file content should not be stored forever unless required.
- Keep template version on each batch.

## Suggested Table Ownership

### Platform Onboarding

```text
import_template
import_batch
import_record
import_validation_error
signup_invitation
```

### Platform Identity

```text
identity_document
contact_channel
verification_challenge
pin_credential
```

### Platform Integration

```text
external_integration_client
api_credential
```
