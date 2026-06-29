# Gamification Domain Model

## Overview

Gamification should be implemented as a separate domain module.

It should consume learning events and generate points, achievements, streaks and avatar rewards.

## Core Flow

```text
Learning Event
  -> Reward Rule Engine
    -> Points Transaction
    -> Achievement Evaluation
    -> Avatar Reward Unlock
```

## Entities

### GamificationProfile

Represents a student's gamification state.

Fields:

- id;
- studentId;
- level;
- totalPoints;
- engagementPoints;
- performancePoints;
- growthPoints;
- currentStreakDays;
- longestStreakDays;
- avatarId;
- createdAt;
- updatedAt.

### PointsWallet

Represents accumulated points by category.

Fields:

- id;
- studentId;
- engagementPoints;
- performancePoints;
- growthPoints;
- totalPoints;
- updatedAt.

### PointsTransaction

Immutable record of awarded or deducted points.

Fields:

- id;
- studentId;
- pointsType;
- amount;
- reasonCode;
- relatedEventId;
- relatedEntityType;
- relatedEntityId;
- createdAt.

Possible points types:

- ENGAGEMENT;
- PERFORMANCE;
- GROWTH.

### Achievement

Represents a badge or accomplishment definition.

Fields:

- id;
- code;
- title;
- description;
- achievementType;
- criteria;
- pointsReward;
- isActive;
- createdAt;
- updatedAt.

Possible achievement types:

- STREAK;
- SUBJECT_MASTERY;
- SKILL_MASTERY;
- IMPROVEMENT;
- CONSISTENCY;
- EXPLORATION;
- REVIEW;
- CHALLENGE.

### StudentAchievement

Represents an achievement unlocked by a student.

Fields:

- id;
- studentId;
- achievementId;
- unlockedAt;
- relatedEntityType;
- relatedEntityId.

### Streak

Represents daily usage consistency.

Fields:

- id;
- studentId;
- streakType;
- currentCount;
- longestCount;
- lastActivityDate;
- updatedAt.

Possible streak types:

- DAILY_ACTIVITY;
- SUBJECT_PRACTICE;
- REVIEW;
- WEEKLY_GOAL.

### Avatar

Represents the student's visual identity.

Fields:

- id;
- studentId;
- avatarThemeId;
- name;
- archetype;
- level;
- createdAt;
- updatedAt.

### AvatarTheme

Represents a visual/RPG theme.

Fields:

- id;
- code;
- name;
- description;
- isSystemProvided;
- isActive.

### AvatarItem

Represents unlockable cosmetic items.

Fields:

- id;
- avatarThemeId;
- code;
- name;
- itemType;
- unlockCriteria;
- isActive.

Possible item types:

- OUTFIT;
- ACCESSORY;
- BACKGROUND;
- BADGE;
- TOOL;
- PET;
- FRAME.

### RewardRule

Defines when points/rewards should be granted.

Fields:

- id;
- code;
- eventType;
- conditions;
- rewardType;
- rewardAmount;
- isActive;
- createdAt;
- updatedAt.

## Events Consumed by Gamification

Examples:

- ACTIVITY_COMPLETED;
- QUESTION_ANSWERED_CORRECTLY;
- SKILL_MASTERY_INCREASED;
- GAP_CLOSED;
- DAILY_STREAK_CONTINUED;
- REVIEW_COMPLETED;
- SUBJECT_SELECTED;
- GOAL_COMPLETED.

## MVP

Implement:

- GamificationProfile;
- PointsTransaction;
- Basic streak;
- Basic achievements;
- Avatar profile;
- Admin flag to enable/disable gamification.
