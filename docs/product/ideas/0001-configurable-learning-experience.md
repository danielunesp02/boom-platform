# Idea 0001 - Configurable Learning Experience

## Status

Captured

## Source

Business/product idea captured during product discovery.

## Summary

Boom should support flexible configuration of each student's learning experience. The platform should not force a single teaching method, fixed curriculum or fixed set of subjects.

Different users and organizations should be able to configure:

- learning goals;
- available subjects;
- teaching methodology;
- level of student autonomy;
- gamification settings;
- avatar/RPG experience;
- institutional restrictions.

This is especially important because Boom may serve both family use cases and school/institutional use cases.

## Problem

A learning platform that assumes one fixed methodology becomes too rigid for different contexts:

- a family may want the student to freely explore subjects;
- a school may want strict curriculum control;
- a tutor may want to define specific exam-preparation goals;
- an international student may need to switch between country-based curricula;
- students may be more engaged if the platform provides motivation, progression and identity.

## Business Value

This feature makes Boom more than a quiz generator. It becomes a configurable learning platform that can serve multiple markets:

- families;
- schools;
- private tutors;
- homeschooling groups;
- exam-preparation programs;
- international relocation preparation;
- language and curriculum adaptation programs.

## Core Idea

Boom should support this model:

```text
Tenant / Organization
  -> Admin Policy
    -> Available Subjects
    -> Available Teaching Methods
    -> Student Freedom Rules
    -> Gamification Rules

Student
  -> Learning Profile
    -> Goals
    -> Selected Subjects
    -> Preferred Methodology
    -> Progression Strategy
    -> Gamification Profile
```

## Key Product Questions

1. Who defines the student's learning goals?
2. Can the student choose subjects freely?
3. Can the student choose the teaching methodology?
4. Can the school restrict available methods?
5. Should gamification be enabled by default?
6. Can rankings create negative pressure?
7. Should avatars be purely cosmetic or tied to learning progression?
8. How much autonomy is appropriate by student age?
9. Should parents/guardians approve changes?
10. How should the platform adapt daily activities based on these settings?
