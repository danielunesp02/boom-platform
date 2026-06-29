# ADR-0007 - Configurable Learning and Gamification

## Status

Proposed

## Context

Boom is evolving from a simple learning tool into a flexible learning platform.

The platform should be able to support:

- family use;
- school use;
- tutor use;
- student-specific goals;
- different countries and curriculum strategies;
- different teaching methods;
- controlled student autonomy;
- gamification and avatar-based engagement.

If these capabilities are hardcoded, Boom will become difficult to adapt to new use cases.

## Decision

Boom will introduce:

1. A configurable learning profile per student.
2. Admin-controlled learning policies.
3. Subject availability configuration.
4. Teaching method configuration.
5. Gamification as a separate bounded context.
6. Avatar/RPG mechanics based on original themes.
7. Feature flags and policy-based behavior resolution.

## Consequences

### Positive

- Supports multiple customer segments.
- Enables school and family modes.
- Makes the product more flexible.
- Reduces future rework.
- Improves student engagement.
- Keeps gamification optional and controllable.

### Trade-offs

- More objects upfront.
- More policy resolution complexity.
- Requires careful UX to avoid overwhelming users.
- Requires moderation of gamification mechanics.
- Requires care with privacy and school settings.

## Important Constraints

- Do not use copyrighted heroes or branded characters.
- Do not make public rankings mandatory.
- Do not reward only naturally high-performing students.
- Do not allow school students to bypass institutional restrictions.
- Do not make AI-generated learning changes without traceability.
