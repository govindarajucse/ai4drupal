# R&R SDLC Phases Reference

## Phase Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    R&R SDLC Pipeline Flow                       │
└─────────────────────────────────────────────────────────────────┘

    ┌──────────────┐
    │ USER REQUEST │
    └──────┬───────┘
           │
           ▼
┌──────────────────────┐    Gate: Acceptance
│  1. REQUIREMENTS     │◄── criteria complete
│  @requirements-analyst│
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐    Gate: Architecture
│  2. DESIGN           │◄── approved
│  Architecture Review │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│  3. IMPLEMENTATION   │    (Development phase)
│  AI-Assisted Coding  │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐    Gate: No critical
│  4. CODE REVIEW      │◄── issues
│  @code-reviewer      │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐    Gate: Coverage
│  5. TESTING          │◄── ≥80%
│  @test-engineer      │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐    Gate: No critical
│  6. SECURITY AUDIT   │◄── vulnerabilities
│  @security-auditor   │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐    Gate: All
│  7. DEPLOYMENT       │◄── prerequisites met
│  @deployment-engineer│
└──────────┬───────────┘
           │
           ▼
    ┌──────────────┐
    │   RELEASE    │
    └──────────────┘
```

## Phase Details

### Phase 1: Requirements
**Duration**: 1-3 days
**Agent**: `@requirements-analyst`
**Artifacts**:
- User stories
- Acceptance criteria
- Technical considerations
- Dependency map
- Risk assessment

### Phase 2: Design
**Duration**: 1-2 days
**Activities**:
- Architecture decisions
- Data model design
- API contract definition
- Integration planning

### Phase 3: Implementation
**Duration**: Variable
**Activities**:
- AI-assisted coding
- Module development
- Configuration setup
- Documentation

### Phase 4: Code Review
**Duration**: 0.5-1 day
**Agent**: `@code-reviewer`
**Artifacts**:
- Review report
- Issue list
- Recommendations

### Phase 5: Testing
**Duration**: 1-2 days
**Agent**: `@test-engineer`
**Artifacts**:
- Test plan
- Test code
- Coverage report

### Phase 6: Security Audit
**Duration**: 0.5-1 day
**Agent**: `@security-auditor`
**Artifacts**:
- Security report
- Vulnerability list
- Remediation plan

### Phase 7: Deployment
**Duration**: 0.5-1 day
**Agent**: `@deployment-engineer`
**Artifacts**:
- Deployment plan
- Rollback procedure
- Communication plan

## Quality Gates

| Gate | Phase | Criteria | Blocking |
|------|-------|----------|----------|
| G1 | Requirements | Acceptance criteria defined | Yes |
| G2 | Design | Architecture approved | Yes |
| G3 | Review | No critical issues | Yes |
| G4 | Testing | 80% coverage | No |
| G5 | Security | No critical vulns | Yes |
| G6 | Deployment | Prerequisites met | Yes |

## Phase Transitions

### Requirements → Design
- [ ] All user stories complete
- [ ] Acceptance criteria testable
- [ ] Stakeholder approval

### Design → Implementation
- [ ] Architecture documented
- [ ] Data model finalized
- [ ] API contracts defined

### Implementation → Review
- [ ] Code complete
- [ ] Self-review done
- [ ] PR created

### Review → Testing
- [ ] No critical issues
- [ ] All comments addressed
- [ ] Standards compliant

### Testing → Security
- [ ] All tests passing
- [ ] Coverage meets target
- [ ] Edge cases covered

### Security → Deployment
- [ ] No unmitigated vulnerabilities
- [ ] Dependencies updated
- [ ] Configuration secure

### Deployment → Release
- [ ] All gates passed
- [ ] Rollback tested
- [ ] Stakeholders notified
