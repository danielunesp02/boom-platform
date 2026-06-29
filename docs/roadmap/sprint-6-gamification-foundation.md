# Sprint 6 - Gamification Foundation

## Goal

Introduce the first version of the gamification engine.

## Scope

1. GamificationProfile.
2. PointsTransaction.
3. PointsWallet.
4. Streak.
5. Achievement.
6. StudentAchievement.
7. Avatar.
8. AvatarTheme.
9. Basic reward rules.
10. Admin flag to enable/disable gamification.

## Acceptance Criteria

- Student has a gamification profile.
- Completing an activity can generate points.
- Points are stored as immutable transactions.
- Total points are visible.
- Daily streak is calculated.
- At least three achievements can be unlocked.
- Student can have an avatar.
- Gamification can be disabled by policy.
- No public leaderboard in MVP.

## Initial Achievements

Examples:

```text
FIRST_ACTIVITY_COMPLETED
THREE_DAY_STREAK
FIRST_SKILL_MASTERED
FIRST_GAP_CLOSED
FIRST_REVIEW_COMPLETED
```

## Out of Scope

- Public rankings.
- Multiplayer features.
- Complex avatar marketplace.
- Paid cosmetic items.
- Real-time notifications.
