# AI4Drupal — Orchestration Engine

An AI-assisted Software Development Lifecycle (SDLC) pipeline for Drupal projects using VS Code Copilot customizations with **evaluation gates** and **Jira integration**.

## Overview

This repository provides a complete **6-phase SDLC pipeline** with:

- **Persona Modes** for PO/BA, Tech Lead, Developer, QA
- **Custom Agents** for each SDLC phase
- **Evaluation Gates (E1-E6)** that score quality and optimize token spend
- **File-specific Instructions** for Drupal development
- **Prompt Templates** for common tasks
- **Skills** for workflow orchestration
- **Hooks** for automated quality enforcement
- **Jira MCP Integration** for ticket-driven workflows

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
│         │   │         │   │         │   │         │   │         │   │         │
│Epic+Tech│   │  Repo   │   │Arch+Dev │   │Compile+ │   │  QA +   │   │ Review  │
│Analysis │   │ Config  │   │Implement│   │ Verify  │   │Coverage │   │Loop + PR│
└────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘
     │E1           │E2           │E3           │E4           │E5           │E6
     ▼             ▼             ▼             ▼             ▼             ▼
   ≥80%          100%          ≥85%          ≥90%          ≥85%          100%
```

**○ Evaluation gate after each phase — scores quality, optimizes token spend**

## OUTPUTS

| Output | Description |
|--------|-------------|
| ✓ **Epic + Stories** | Functional spec, vertical slicing, AC |
| ✓ **Repo + Branch** | Configured, ready |
| ✓ **Production Code** | Tested + reviewed |
| ✓ **Merged PR** | Jira updated |

## Quick Start

### All Agents

| Agent | Command | Phase |
|-------|---------|-------|
| Epic Planner | `@epic-planner` | PLAN |
| Tech Analyst | `@tech-analyst` | PLAN |
| Requirements Analyst | `@requirements-analyst` | PLAN |
| Repo Setup | `@repo-setup` | SETUP |
| Architect | `@architect` | CODE |
| Developer | `@developer` | CODE |
| Code Reviewer | `@code-reviewer` | BUILD |
| QA Tester | `@qa-tester` | TEST |
| Security Auditor | `@security-auditor` | TEST |
| Deployment Engineer | `@deployment-engineer` | RELEASE |

### Available Prompts

| Prompt | Command | Purpose |
|--------|---------|---------|
| New Module | `/drupal-module` | Generate module scaffold |
| Migration | `/drupal-migrate` | Create migration scripts |
| Code Review | `/code-review` | Trigger code review |
| Test Plan | `/test-plan` | Generate test plan |
| Security Scan | `/security-scan` | Run security audit |
| Deployment | `/deployment-checklist` | Prepare deployment |

### Jira-Integrated Prompts

| Prompt | Command | Purpose |
|--------|---------|---------|
| Jira Requirements | `/jira-requirements PROJ-123` | Requirements from ticket |
| Jira Design | `/jira-design PROJ-123` | Technical architecture |
| Jira Implement | `/jira-implement PROJ-123` | Code from ticket |
| Jira Review | `/jira-review PROJ-123` | Code review → ticket |
| Jira Test | `/jira-test PROJ-123` | Tests from acceptance criteria |
| Jira Security | `/jira-security PROJ-123` | Security audit tracking |
| Jira Release | `/jira-release v1.0.0` | Release notes from tickets |

### SDLC Skill

Run the full pipeline:
```
/drupal-sdlc PROJ-123          # Full pipeline from ticket
@epic-planner PROJ-123          # PO/BA entry point
@developer feature-name         # Developer agentic mode
```

## Jira Setup

See [Jira Setup Guide](.github/skills/drupal-sdlc/references/jira-setup.md) for configuration.

**Quick setup:**
```powershell
# 1. Copy MCP config template
Copy-Item .vscode/mcp.example.json .vscode/mcp.json

# 2. Set environment variables
[System.Environment]::SetEnvironmentVariable('JIRA_HOST', 'https://your-domain.atlassian.net', 'User')
[System.Environment]::SetEnvironmentVariable('JIRA_EMAIL', 'your-email@example.com', 'User')
[System.Environment]::SetEnvironmentVariable('JIRA_API_TOKEN', 'your-api-token', 'User')

# 3. Restart VS Code
```

## Evaluation Gates

Each phase has an evaluation gate that scores quality and optimizes token spend.

| Gate | Phase | Threshold | Action on Fail |
|------|-------|-----------|----------------|
| E1 | PLAN | ≥80% | Return to planning |
| E2 | SETUP | 100% | Complete setup |
| E3 | CODE | ≥85% | Fix code issues |
| E4 | BUILD | ≥90% | Address review |
| E5 | TEST | ≥85% | Add tests |
| E6 | RELEASE | 100% | Complete prerequisites |

### Scoring Formula
```
Gate Score = (Criteria Met / Total Criteria) × Weight Multiplier
- Critical criteria: 2.0x
- Standard criteria: 1.0x
- Optional criteria: 0.5x
```

## Integrations

| Tool | Purpose |
|------|---------|
| **IDE** | VS Code with Copilot |
| **AI Coding Assistant** | GitHub Copilot |
| **Jira** | Ticket management |
| **Confluence** | Documentation |
| **GitHub** | Version control, PR |
| **Figma** | UI/UX designs |

## Directory Structure

```
.github/
├── copilot-instructions.md      # Project-wide Drupal standards
├── instructions/                # File-specific instructions
├── agents/                      # Phase agents (10 agents)
│   ├── epic-planner.agent.md
│   ├── tech-analyst.agent.md
│   ├── repo-setup.agent.md
│   ├── developer.agent.md
│   ├── qa-tester.agent.md
│   └── ...
├── prompts/                     # Prompt templates
├── skills/drupal-sdlc/          # SDLC orchestration skill
├── hooks/                       # Automation hooks
└── evaluations/                 # Evaluation gates (E1-E6)
    ├── E1-plan-gate.md
    ├── E2-setup-gate.md
    ├── E3-code-gate.md
    ├── E4-build-gate.md
    ├── E5-test-gate.md
    └── E6-release-gate.md
```

## Contributing

1. Follow Drupal coding standards
2. Run all evaluation gates before PR
3. Include tests for new functionality
4. Update documentation as needed

## License

MIT