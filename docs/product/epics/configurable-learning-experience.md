# Epic - Configurable Learning Experience

## Goal

Allow Boom to adapt the learning experience to different students, families, tutors and schools.

## Users

### Student

Wants a motivating, personalized and understandable learning experience.

### Guardian

Wants visibility and control over learning goals, subjects and progress.

### School Admin

Wants to configure the platform according to institutional rules, curriculum and pedagogical policy.

### Tutor / Teacher

Wants to define learning objectives, select subjects and adjust the methodology for specific students or groups.

## Functional Scope

### Learning Goals

The platform should allow goals such as:

- improve mathematics foundation;
- prepare for Italian school system;
- improve English reading comprehension;
- reinforce science concepts;
- prepare for a specific exam;
- maintain daily learning habit;
- close identified skill gaps;
- accelerate advanced learners.

### Subject Selection

The platform should allow configuration of available subjects.

Examples:

- Mathematics;
- Science;
- English;
- Italian;
- Portuguese;
- History;
- Geography;
- Technology;
- Digital Competence;
- Arts;
- Music.

Subject selection may be:

- fully controlled by admin;
- suggested by guardian/teacher;
- freely chosen by student;
- partially restricted by institution.

### Teaching Method Selection

The platform should allow different teaching methods or curriculum strategies.

Examples:

- country-based curriculum;
- mastery learning;
- project-based learning;
- competency-based learning;
- exam preparation;
- adaptive daily practice;
- traditional sequence;
- remediation-first sequence;
- enrichment-first sequence.

### Country-Based Methods

Examples:

- Italy;
- Brazil;
- Portugal;
- United Kingdom;
- United States;
- International curriculum;
- Custom curriculum.

### Admin-Controlled Freedom

The admin should define how much autonomy each user type has.

Examples:

- student can select subjects;
- student can change teaching method;
- student can create goals;
- guardian approval is required;
- school restricts curriculum to specific subjects;
- gamification is enabled or disabled;
- rankings are disabled for younger students;
- AI explanations are enabled or disabled.

## Out of Scope for MVP

- Full authentication model;
- Full school-grade management;
- Complex teacher workflow;
- Real-time multiplayer gamification;
- Payment/billing;
- AI-generated curriculum import.

## MVP

The first MVP should support:

1. Admin-defined available subjects.
2. Admin-defined available teaching methods.
3. Student learning profile.
4. Student selected subjects, if allowed.
5. Student preferred teaching method, if allowed.
6. Guardian/admin override.
7. API-ready policy model.
