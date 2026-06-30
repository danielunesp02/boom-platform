# Authentication Domain Model

## GuardianAccount

```text
id
displayName
username
email
phoneNumberMasked
phoneNumberHash
phoneVerifiedAt
status
createdAt
updatedAt
lastLoginAt
```

## PasswordCredential

```text
id
guardianAccountId
passwordHash
algorithm
createdAt
updatedAt
lastChangedAt
status
```

Rules:

```text
never store plain-text password
never return password hash in API response
support future password rotation
```

## IdentityDocument

```text
id
guardianAccountId
country
documentType
documentNumberHash
documentNumberMasked
encryptedDocumentNumber optional
verifiedAt
status
createdAt
```

Rules:

```text
raw document should not be exposed
document hash used for duplicate detection
masked value used for display
encryption only if full recovery is legally required
```

## PhoneVerificationChallenge

```text
id
guardianAccountId
phoneNumberHash
challengeCodeHash
expiresAt
attempts
maxAttempts
verifiedAt
status
createdAt
```

## StudentProfile

```text
id
guardianAccountId
displayName
avatarKey
preferredLocale
schoolGrade
status
createdAt
updatedAt
```

## StudentPinCredential

```text
id
studentProfileId
pinHash
algorithm
createdAt
updatedAt
failedAttempts
lockedUntil
status
```

## TrustedDevice

```text
id
guardianAccountId
deviceName
deviceType
deviceFingerprintHash
publicKey optional
trustedUntil
lastUsedAt
status
createdAt
revokedAt
```

## QrLoginChallenge

```text
id
challengeCodeHash
requestedBrowserSessionId
approvedByGuardianId
approvedByDeviceId
studentProfileId
status
expiresAt
approvedAt
consumedAt
createdAt
```

Lifecycle:

```text
PENDING
APPROVED
CONSUMED
EXPIRED
DENIED
CANCELLED
```

## AuthSession

```text
id
subjectType
subjectId
guardianAccountId optional
studentProfileId optional
sessionTokenHash
createdAt
expiresAt
revokedAt
lastUsedAt
ipHash
userAgentHash
status
```
