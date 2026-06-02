# AI4Drupal — Orchestration Engine

## WHO USES IT (Personas)

| Persona | Mode | Entry Point |
|---------|------|-------------|
| **PO / Business Analyst** | Epic Planning | `@epic-planner` |
| **Tech Lead / Architect** | Tech Analysis | `@tech-analyst` |
| **Developer** | Agentic Mode | `@developer` |
| **QA / Tester** | Agentic Mode | `@qa-tester` |

## Phase Pipeline

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                      AI4DRUPAL — ORCHESTRATION ENGINE                           │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
│  PHASE  │   │  PHASE  │   │  PHASE  │   │  PHASE  │   │  PHASE  │   │  PHASE  │
│  PLAN   │──▶│  SETUP  │──▶│  CODE   │──▶│  BUILD  │──▶│  TEST   │──▶│ RELEASE │
│         │   │         │   │         │   │         │   │         │   │         │
│ Epic +  │   │  Repo   │   │ Arch +  │   │Compile +│   │  QA +   │   │ Review  │
│Tech Ana │   │ Config  │   │ Design +│   │ Verify  │   │Coverage │   │Loop + PR│
│+ Req +  │   │         │   │Implement│   │         │   │         │   │         │
│  RCA    │   │         │   │         │   │         │   │         │   │         │
└────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘
     │             │             │             │             │             │
     ▼             ▼             ▼             ▼             ▼             ▼
  ┌─────┐      ┌─────┐       ┌─────┐       ┌─────┐       ┌─────┐       ┌─────┐
  │ E1  │      │ E2  │       │ E3  │       │ E4  │       │ E5  │       │ E6  │
  │GATE │      │GATE │       │GATE │       │GATE │       │GATE │       │GATE │
  └─────┘      └─────┘       └─────┘       └─────┘       └─────┘       └─────┘

○ Evaluation gate after each phase — scores quality, optimizes token spend

┌─────────────────────────────────────────────────────────────────────────────────┐
│  Integrations:  IDE │ AI Coding Assistant │ Jira │ Confluence │ GitHub │ Figma  │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## OUTPUTS

| Output | Description |
|--------|-------------|
| ✓ **Epic + Stories** | Functional spec, vertical slicing, AC |
| ✓ **Repo + Branch** | Configured, ready |
| ✓ **Production Code** | Tested + reviewed |
| ✓ **Merged PR** | Jira updated |

## Phase Details

### Phase 1: PLAN
**Activities**: Epic + Tech Analysis + Requirements + RCA
**Agents**: `@epic-planner`, `@tech-analyst`, `@requirements-analyst`
**Duration**: 1-3 days
**Artifacts**:
- Epic breakdown with vertical slicing
- User stories with acceptance criteria
- Technical analysis document
- Root cause analysis (for bugs/issues)
- Dependency map
- Risk assessment

**Evaluation Gate E1**:
- [ ] Epic properly decomposed
- [ ] All stories have testable AC
- [ ] Technical feasibility confirmed
- **Score threshold**: ≥80%

### Phase 2: SETUP
**Activities**: Repo Config
**Agent**: `@repo-setup`
**Duration**: 0.5 day
**Artifacts**:
- Feature branch created
- CI/CD pipeline configured
- Development environment ready
- Drupal scaffolding (if new module)

**Evaluation Gate E2**:
- [ ] Branch naming convention followed
- [ ] CI checks passing
- [ ] Dev environment verified
- **Score threshold**: 100%

### Phase 3: CODE
**Activities**: Architecture + Design + Implement
**Agents**: `@architect`, `@developer`
**Duration**: Variable
**Artifacts**:
- Architecture Decision Records (ADRs)
- Data model specifications
- API contracts
- Working Drupal code
- Module structure
- Service definitions

**Evaluation Gate E3**:
- [ ] Architecture documented
- [ ] Code follows Drupal standards
- [ ] No critical PHPCS/PHPStan errors
- **Score threshold**: ≥85%

### Phase 4: BUILD
**Activities**: Compile + Verify
**Agent**: `@code-reviewer`
**Duration**: 0.5-1 day
**Artifacts**:
- Compilation verification
- Static analysis report
- Code review comments
- Standards compliance check

**Evaluation Gate E4**:
- [ ] Zero critical issues
- [ ] All review comments addressed
- [ ] Drupal coding standards met
- **Score threshold**: ≥90%

### Phase 5: TEST
**Activities**: QA + Coverage
**Agents**: `@qa-tester`, `@security-auditor`
**Duration**: 1-2 days
**Artifacts**:
- Test plan
- Unit/Kernel/Functional tests
- Coverage report
- Security scan results
- Accessibility check

**Evaluation Gate E5**:
- [ ] ≥80% code coverage
- [ ] All AC verified
- [ ] No critical security vulns
- **Score threshold**: ≥85%

### Phase 6: RELEASE
**Activities**: Review Loop + PR
**Agent**: `@deployment-engineer`
**Duration**: 0.5-1 day
**Artifacts**:
- Pull request
- Deployment checklist
- Rollback procedure
- Jira ticket updated
- Release notes

**Evaluation Gate E6**:
- [ ] All gates passed
- [ ] PR approved
- [ ] Jira status updated
- **Score threshold**: 100%

## Evaluation Gates (Quality Scoring)

Each phase has an evaluation gate that scores quality and optimizes token spend.

| Gate | Phase | Criteria | Score Threshold | Blocking |
|------|-------|----------|-----------------|----------|
| E1 | PLAN | Epic decomposed, AC testable | ≥80% | Yes |
| E2 | SETUP | Branch created, CI passing | 100% | Yes |
| E3 | CODE | Architecture + standards | ≥85% | Yes |
| E4 | BUILD | Zero critical issues | ≥90% | Yes |
| E5 | TEST | Coverage + security | ≥85% | Yes |
| E6 | RELEASE | All gates + PR approved | 100% | Yes |

### Scoring Formula

```
Gate Score = (Criteria Met / Total Criteria) × Weight Multiplier

Weight Multipliers:
- Critical criteria: 2.0x
- Standard criteria: 1.0x
- Optional criteria: 0.5x
```

### Token Optimization

- **Pass**: Proceed to next phase
- **Partial (70-threshold)**: Review and fix specific issues
- **Fail (<70%)**: Return to previous phase with feedback

## Phase Transitions

### PLAN → SETUP
- [ ] All user stories complete
- [ ] Acceptance criteria testable
- [ ] Technical analysis approved
- [ ] RCA complete (if applicable)
- **Gate E1 Score**: ≥80%

### SETUP → CODE
- [ ] Feature branch created
- [ ] CI pipeline configured
- [ ] Development environment ready
- **Gate E2 Score**: 100%

### CODE → BUILD
- [ ] Architecture documented
- [ ] Code complete
- [ ] Self-review done
- **Gate E3 Score**: ≥85%

### BUILD → TEST
- [ ] Zero critical review issues
- [ ] All comments addressed
- [ ] Standards compliant
- **Gate E4 Score**: ≥90%

### TEST → RELEASE
- [ ] All tests passing
- [ ] Coverage ≥80%
- [ ] No critical security vulnerabilities
- **Gate E5 Score**: ≥85%

### RELEASE → MERGED
- [ ] All gates passed
- [ ] PR approved
- [ ] Jira ticket updated
- **Gate E6 Score**: 100%

## Integrations

| Tool | Purpose | Phase(s) |
|------|---------|----------|
| **IDE** | Development environment | All |
| **AI Coding Assistant** | Code generation, review | CODE, BUILD |
| **Jira** | Ticket management, tracking | All |
| **Confluence** | Documentation | PLAN, CODE |
| **GitHub** | Version control, PR | SETUP, RELEASE |
| **Figma** | UI/UX designs | PLAN, CODE |
