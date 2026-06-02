---
description: "Generate a deployment checklist and plan for Drupal releases"
name: "Deployment Checklist"
agent: "deployment-engineer"
argument-hint: "Release version or feature being deployed"
---
Generate a deployment plan covering:

## Deployment Components

### 1. Prerequisites Verification
- [ ] Code review completed
- [ ] All tests passing
- [ ] Security audit passed
- [ ] Configuration exported
- [ ] Database backup ready
- [ ] Rollback procedure documented

### 2. Environment Details
- Target environment
- Deployment window
- Estimated duration
- Required access/permissions

### 3. Deployment Steps
Complete step-by-step commands for:
- Pre-deployment preparation
- Maintenance mode
- Code deployment
- Composer install
- Database updates
- Configuration import
- Cache clear
- Post-deployment verification

### 4. Smoke Tests
List of critical paths to verify:
- Homepage
- User authentication
- Key functionality
- Admin access

### 5. Rollback Procedure
Complete rollback steps including:
- Database restore
- Code revert
- Configuration restore
- Verification steps

### 6. Communication Plan
- Stakeholder notifications
- User-facing maintenance messages
- Status updates

## Output
Provide complete deployment plan ready for execution.
