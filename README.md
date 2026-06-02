# AI4Drupal - R&R AI SDLC Pipeline

An AI-assisted Software Development Lifecycle (SDLC) pipeline for Drupal projects using VS Code Copilot customizations with **Jira integration**.

## Overview

This repository provides a complete **R&R (Requirements & Review)** methodology implementation with:

- **Custom Agents** for each SDLC phase
- **File-specific Instructions** for Drupal development
- **Prompt Templates** for common tasks
- **Skills** for workflow orchestration
- **Hooks** for automated quality enforcement
- **Evaluation Gates** for quality assurance
- **Jira MCP Integration** for ticket-driven workflows

## Quick Start

### Available Agents

| Agent | Command | Purpose |
|-------|---------|---------|
| Requirements Analyst | `@requirements-analyst` | Gather & document requirements || Architect | `@architect` | Technical design & architecture |
| Implementation Assistant | `@implementation-assistant` | Code generation & development || Code Reviewer | `@code-reviewer` | Quality & standards review |
| Test Engineer | `@test-engineer` | Test planning & execution |
| Security Auditor | `@security-auditor` | Vulnerability assessment |
| Deployment Engineer | `@deployment-engineer` | Release management |

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

Run the full pipeline with `/drupal-sdlc` or `/drupal-sdlc PROJ-123` for ticket-driven workflow.

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

## R&R SDLC Workflow

```
Requirements → Design → Implementation → Review → Testing → Security → Deployment
     ↓           ↓           ↓            ↓         ↓          ↓          ↓
@requirements @architect @implementation @code-   @test-   @security- @deployment-
  -analyst                 -assistant    reviewer  engineer   auditor    engineer
```

## Quality Gates

| Gate | Phase | Threshold |
|------|-------|-----------|
| G1: Requirements | Requirements | Acceptance criteria complete |
| G2: Design | Design | Architecture documented |
| G3: Implementation | Implementation | Standards compliance |
| G4: Code Quality | Review | PHPCS + PHPStan zero errors |
| G5: Test Coverage | Testing | ≥80% coverage |
| G6: Security | Security | Zero critical/high vulnerabilities |
| G7: Deployment | Deployment | All smoke tests pass |

## Directory Structure

```
.github/
├── copilot-instructions.md      # Project-wide Drupal standards
├── instructions/                # File-specific instructions
├── agents/                      # R&R phase agents
├── prompts/                     # Prompt templates
├── skills/drupal-sdlc/          # SDLC orchestration skill
├── hooks/                       # Automation hooks
└── evaluations/                 # Quality gate definitions
```

## Contributing

1. Follow Drupal coding standards
2. Run all quality gates before PR
3. Include tests for new functionality
4. Update documentation as needed

## License

MIT