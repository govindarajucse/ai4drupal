---
name: drupal-sdlc
description: 'Complete Drupal R&R SDLC pipeline orchestration with Jira integration. Use when running full development lifecycle: requirements gathering, code review, testing, security audit, and deployment. Supports ticket-driven workflows via Jira MCP.'
argument-hint: "Feature, Jira ticket (PROJ-123), or module to process through the SDLC pipeline"
user-invocable: true
---
# Drupal R&R SDLC Pipeline

## Overview
This skill orchestrates the complete Software Development Lifecycle for Drupal projects using the R&R (Requirements & Review) methodology.

## When to Use
- Processing a new feature through the full SDLC
- Running quality gates before release
- Orchestrating multi-phase development workflow
- Ensuring compliance with all R&R phases

## SDLC Phases

### Phase 1: Requirements Gathering
**Agent**: `@requirements-analyst`

**Activities**:
1. Analyze user request/ticket
2. Search codebase for related functionality
3. Document functional requirements
4. Define acceptance criteria (Given/When/Then)
5. Identify dependencies and risks

**Output**: Requirements specification document

**Gate Criteria**:
- [ ] User stories complete
- [ ] Acceptance criteria defined
- [ ] Dependencies identified
- [ ] Stakeholder sign-off

### Phase 2: Design
**Agent**: `@architect`

**Activities**:
1. Analyze requirements for technical implications
2. Research Drupal solutions (contrib modules, patterns)
3. Design component architecture
4. Define data models and APIs
5. Create Architecture Decision Records (ADRs)
6. Break down into implementation tasks

**Output**: Technical design document

**Gate Criteria**:
- [ ] Architecture decisions documented
- [ ] Data model defined
- [ ] API contracts specified
- [ ] Implementation tasks created

### Phase 3: Implementation
**Agent**: `@implementation-assistant`

**Activities**:
1. Generate module structure
2. Implement services, plugins, controllers
3. Follow Drupal coding standards
4. Add proper documentation
5. Create test stubs
6. Update Jira with progress

**Output**: Working Drupal code

**Gate Criteria**:
- [ ] Code follows standards
- [ ] All acceptance criteria addressed
- [ ] Documentation complete
- [ ] Test stubs created

### Phase 4: Code Review
**Agent**: `@code-reviewer`

**Activities**:
1. Review code against Drupal standards
2. Check security compliance
3. Evaluate performance patterns
4. Verify test coverage
5. Document findings

**Output**: Code review report

**Gate Criteria**:
- [ ] No critical issues
- [ ] Security review passed
- [ ] Standards compliance verified

### Phase 5: Testing
**Agent**: `@test-engineer`

**Activities**:
1. Create test plan
2. Identify test scenarios
3. Write unit/kernel/functional tests
4. Execute tests
5. Report coverage

**Output**: Test plan and test code

**Gate Criteria**:
- [ ] All tests passing
- [ ] Coverage ≥ 80%
- [ ] Edge cases covered

### Phase 6: Security Audit
**Agent**: `@security-auditor`

**Activities**:
1. OWASP Top 10 assessment
2. Drupal-specific security review
3. Dependency vulnerability scan
4. Access control verification
5. Document vulnerabilities

**Output**: Security audit report

**Gate Criteria**:
- [ ] No critical vulnerabilities
- [ ] No high vulnerabilities unmitigated
- [ ] Dependencies up to date

### Phase 7: Deployment
**Agent**: `@deployment-engineer`

**Activities**:
1. Verify prerequisites
2. Create deployment plan
3. Document rollback procedure
4. Prepare smoke tests
5. Communication plan

**Output**: Deployment plan

**Gate Criteria**:
- [ ] All prerequisites met
- [ ] Rollback documented
- [ ] Stakeholders notified

## Pipeline Execution

### Quick Pipeline
```
/drupal-sdlc {feature} --quick
```
Runs abbreviated checks for low-risk changes.

### Full Pipeline
```
/drupal-sdlc {feature} --full
```
Runs complete SDLC with all gates.

### Single Phase
```
@{agent-name} {feature}
```
Runs individual phase only.

## Jira Integration

All agents support Jira MCP for ticket-driven workflows:

### Jira Prompts
| Prompt | Purpose |
|--------|---------|
| `/jira-requirements` | Requirements from ticket |
| `/jira-design` | Technical architecture |
| `/jira-implement` | Code from ticket |
| `/jira-review` | Code review → ticket |
| `/jira-test` | Tests from acceptance criteria |
| `/jira-security` | Security audit → vulnerabilities |
| `/jira-release` | Release notes from fixVersion |

### Ticket-Driven Pipeline
```
/drupal-sdlc PROJ-123
```
Runs full SDLC using Jira ticket as input, updates ticket at each phase.

## References
- [Coding Standards](./references/coding-standards.md)
- [SDLC Phases](./references/sdlc-phases.md)
- [Security Checklist](./references/security-checklist.md)
- [Jira Setup](./references/jira-setup.md)

## Validation Script
Run [validate-drupal.sh](./scripts/validate-drupal.sh) at each phase transition.

## Quality Gate Summary

| Phase | Agent | Gate | Blocking |
|-------|-------|------|----------|
| Requirements | requirements-analyst | Acceptance criteria | Yes |
| Design | architect | Architecture documented | Yes |
| Implementation | implementation-assistant | Standards compliance | No |
| Review | code-reviewer | No critical issues | Yes |
| Testing | test-engineer | 80% coverage | No |
| Security | security-auditor | No critical vulns | Yes |
| Deployment | deployment-engineer | Prerequisites met | Yes |
