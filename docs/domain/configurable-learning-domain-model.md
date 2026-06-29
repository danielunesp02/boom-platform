# Configurable Learning Domain Model

## Overview

This document defines the initial domain objects needed to support flexible learning configuration.

## Core Concepts

```text
Tenant
  -> Organization
    -> LearningPolicy
    -> SubjectCatalog
    -> TeachingMethodCatalog

Student
  -> StudentLearningProfile
    -> LearningGoal
    -> SubjectEnrollment
    -> TeachingMethodPreference
```

## Entities

### LearningPolicy

Defines what a student can or cannot configure.

Fields:

- id;
- tenantId;
- organizationId;
- name;
- allowStudentSubjectSelection;
- allowStudentGoalSelection;
- allowStudentTeachingMethodSelection;
- requireGuardianApprovalForGoalChanges;
- requireTeacherApprovalForSubjectChanges;
- allowGamification;
- allowLeaderboard;
- allowAvatarCustomization;
- allowAiExplanations;
- createdAt;
- updatedAt.

### TeachingMethod

Represents a teaching method or pedagogical strategy.

Fields:

- id;
- code;
- name;
- description;
- methodType;
- countryCode;
- isSystemProvided;
- isActive;
- createdAt;
- updatedAt.

Possible method types:

- COUNTRY_CURRICULUM;
- PEDAGOGICAL_METHOD;
- EXAM_PREPARATION;
- ADAPTIVE_PRACTICE;
- CUSTOM.

### LearningGoal

Represents a student's learning objective.

Fields:

- id;
- studentId;
- title;
- description;
- goalType;
- targetDate;
- status;
- createdByUserId;
- approvedByUserId;
- createdAt;
- updatedAt.

Possible goal types:

- REMEDIATION;
- ADVANCEMENT;
- EXAM_PREPARATION;
- COUNTRY_TRANSITION;
- LANGUAGE_DEVELOPMENT;
- DAILY_HABIT;
- CUSTOM.

### StudentLearningProfile

Represents personalized learning preferences and constraints.

Fields:

- id;
- studentId;
- primaryTeachingMethodId;
- targetCountry;
- targetSchoolSystem;
- targetGradeLevel;
- autonomyLevel;
- preferredDailyDurationMinutes;
- preferredActivityFrequency;
- createdAt;
- updatedAt.

Possible autonomy levels:

- RESTRICTED;
- GUIDED;
- FLEXIBLE;
- FULL.

### SubjectEnrollment

Represents the subjects selected or assigned to a student.

Fields:

- id;
- studentId;
- subjectId;
- status;
- source;
- assignedByUserId;
- startedAt;
- endedAt;
- createdAt;
- updatedAt.

Possible sources:

- ADMIN_ASSIGNED;
- TEACHER_ASSIGNED;
- GUARDIAN_SELECTED;
- STUDENT_SELECTED;
- SYSTEM_RECOMMENDED.

## Important Modeling Decision

Do not hardcode student freedom in the application logic.

Bad:

```text
if user is student, allow subject selection
```

Good:

```text
if learningPolicy.allowStudentSubjectSelection is true, allow subject selection
```
