---
name: drupal-sdlc
description: 'AI4Drupal Orchestration Engine - Complete SDLC pipeline with 6 phases, persona modes, evaluation gates, and Jira integration. Supports ticket-driven workflows.'
argument-hint: "Feature, Jira ticket (PROJ-123), or module to process through the SDLC pipeline"
user-invocable: true
---
# AI4Drupal — Orchestration Engine

## Overview
This skill orchestrates the complete Software Development Lifecycle for Drupal projects using a 6-phase pipeline with evaluation gates after each phase to score quality and optimize token spend.

## WHO USES IT (Personas)

| Persona | Mode | Entry Agent |
|---------|------|-------------|
| **PO / Business Analyst** | Epic Planning | `@epic-planner` |
| **Tech Lead / Architect** | Tech Analysis | `@tech-analyst` |
| **Developer** | Agentic Mode | `@developer` |
| **QA / Tester** | Agentic Mode | `@qa-tester` |

## Pipeline Phases

```
┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
│  PLAN   │──▶│  SETUP  │──▶│  CODE   │──▶│  BUILD  │──▶│  TEST   │──▶│ RELEASE │
└────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘
     │E1           │E2           │E3           │E4           │E5           │E6
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
**Gate E1**: ≥80% score

**Artifacts**:
- Epic breakdown with vertical slicing
- User stories with acceptance criteria
- Technical analysis document
- Root cause analysis (if bug/incident)

### Phase 2: SETUP
**Activities**: Repo Config  
**Agent**: `@repo-setup`  
**Gate E2**: 100% (all critical items)

**Artifacts**:
- Feature branch created
- CI/CD pipeline configured
- Development environment ready
- Module scaffolding (if new)

### Phase 3: CODE
**Activities**: Architecture + Design + Implement  
**Agents**: `@architect`, `@developer`  
**Gate E3**: ≥85% score

**Artifacts**:
- Architecture Decision Records
- Data model specifications
- Working Drupal code
- Service definitions

### Phase 4: BUILD
**Activities**: Compile + Verify  
**Agent**: `@code-reviewer`  
**Gate E4**: ≥90% score

**Artifacts**:
- Compilation verification
- Static analysis report
- Code review comments
- Standards compliance check

### Phase 5: TEST
**Activities**: QA + Coverage  
**Agents**: `@qa-tester`, `@security-auditor`  
**Gate E5**: ≥85% score

**Artifacts**:
- Test plan and test code
- Coverage report (≥80%)
- Security scan results
- Accessibility check

### Phase 6: RELEASE
**Activities**: Review Loop + PR  
**Agent**: `@deployment-engineer`  
**Gate E6**: 100% (all gates passed)

**Artifacts**:
- Pull request (approved)
- Deployment checklist
- Rollback procedure
- Jira ticket updated

## Evaluation Gates

| Gate | Phase | Threshold | Blocking |
|------|-------|-----------|----------|
| E1 | PLAN | ≥80% | Yes |
| E2 | SETUP | 100% | Yes |
| E3 | CODE | ≥85% | Yes |
| E4 | BUILD | ≥90% | Yes |
| E5 | TEST | ≥85% | Yes |
| E6 | RELEASE | 100% | Yes |

### Gate Scoring
- **PASS**: Proceed to next phase
- **PARTIAL (70-threshold)**: Fix specific issues
- **FAIL (<70%)**: Return to previous phase

## Pipeline Execution

### Full Pipeline (Ticket-Driven)
```
/drupal-sdlc PROJ-123
```
Runs full SDLC using Jira ticket as input.

### Persona Entry Points
```
@epic-planner PROJ-123          # PO/BA starts here
@tech-analyst PROJ-123          # Tech Lead starts here
@developer feature-name         # Developer in agentic mode
@qa-tester PROJ-123             # QA in agentic mode
```

### Single Phase
```
@repo-setup PROJ-123            # SETUP phase only
@code-reviewer feature-name     # BUILD phase only
@deployment-engineer PROJ-123   # RELEASE phase only
```

## Jira Integration

| Prompt | Phase | Purpose |
|--------|-------|---------|
| `/jira-requirements` | PLAN | Extract requirements |
| `/jira-design` | PLAN | Technical architecture |
| `/jira-implement` | CODE | Generate code |
| `/jira-review` | BUILD | Review → comments |
| `/jira-test` | TEST | AC → tests |
| `/jira-security` | TEST | Security audit |
| `/jira-release` | RELEASE | Release notes |

## Integrations

| Tool | Purpose |
|------|---------|
| **IDE** | VS Code with Copilot |
| **AI Coding Assistant** | GitHub Copilot |
| **Jira** | Ticket management |
| **Confluence** | Documentation |
| **GitHub** | Version control, PR |
| **Figma** | UI/UX designs |

## References
- [SDLC Phases](./references/sdlc-phases.md)
- [Coding Standards](./references/coding-standards.md)
- [Security Checklist](./references/security-checklist.md)
- [Jira Setup](./references/jira-setup.md)

## Evaluation Gate Details
- [E1: PLAN Gate](../../evaluations/E1-plan-gate.md)
- [E2: SETUP Gate](../../evaluations/E2-setup-gate.md)
- [E3: CODE Gate](../../evaluations/E3-code-gate.md)
- [E4: BUILD Gate](../../evaluations/E4-build-gate.md)
- [E5: TEST Gate](../../evaluations/E5-test-gate.md)
- [E6: RELEASE Gate](../../evaluations/E6-release-gate.md)

## All Agents

| Agent | Persona | Phase(s) |
|-------|---------|----------|
| `@epic-planner` | PO/BA | PLAN |
| `@tech-analyst` | Tech Lead | PLAN |
| `@requirements-analyst` | — | PLAN |
| `@repo-setup` | — | SETUP |
| `@architect` | — | CODE |
| `@developer` | Developer | CODE |
| `@code-reviewer` | — | BUILD |
| `@qa-tester` | QA/Tester | TEST |
| `@security-auditor` | — | TEST |
| `@deployment-engineer` | — | RELEASE |
