# Policy and Feature Flag Model

## Purpose

Boom must support different operational modes:

- family mode;
- tutor mode;
- school mode;
- institutional mode;
- experimental mode.

This requires feature flags and policies from the beginning.

## Difference Between Feature Flag and Policy

### Feature Flag

Controls whether a capability exists for a tenant or organization.

Example:

```json
{
  "feature": "GAMIFICATION",
  "enabled": true
}
```

### Policy

Controls how a capability behaves.

Example:

```json
{
  "allowStudentSubjectSelection": true,
  "allowLeaderboard": false
}
```

## Policy Layers

Recommended resolution order:

```text
System Default
  -> Tenant Policy
    -> Organization Policy
      -> Classroom / Group Policy
        -> Student Override
```

The most specific policy wins, unless the upper layer marks a restriction as locked.

## Example

A school may allow gamification but block public ranking.

```json
{
  "allowGamification": true,
  "allowAvatarCustomization": true,
  "allowLeaderboard": false,
  "leaderboardMode": "DISABLED"
}
```

A family tenant may allow more freedom.

```json
{
  "allowStudentSubjectSelection": true,
  "allowStudentTeachingMethodSelection": true,
  "allowStudentGoalSelection": true,
  "allowGamification": true,
  "allowAvatarCustomization": true
}
```

## Design Principles

1. Do not hardcode behavior by tenant type.
2. Always resolve behavior through policy.
3. Keep feature flags coarse-grained.
4. Keep policies business-readable.
5. Store policy changes in audit logs.
6. Prefer safe defaults for schools.
7. Allow experimentation without code changes.
