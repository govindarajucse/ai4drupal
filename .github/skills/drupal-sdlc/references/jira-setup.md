# Jira Integration Setup

## Overview
This guide configures the Jira MCP server to integrate with the AI4Drupal R&R SDLC pipeline.

## Prerequisites
- Node.js 18+ installed
- Jira Cloud or Server instance
- API token (Cloud) or Personal Access Token (Server)

## Quick Start

```bash
# 1. Copy the MCP config template
cp .vscode/mcp.example.json .vscode/mcp.json

# 2. Set your environment variables (see Step 2 below)

# 3. Restart VS Code
```

## Step 1: Get Jira Credentials

### Jira Cloud
1. Go to https://id.atlassian.com/manage-profile/security/api-tokens
2. Click **Create API token**
3. Name it "VS Code Copilot"
4. Copy the token

### Jira Server/Data Center
1. Go to Profile → Personal Access Tokens
2. Create new token with appropriate permissions
3. Copy the token

## Step 2: Configure Environment Variables

### Option A: System Environment (Recommended)

**Windows (PowerShell):**
```powershell
[System.Environment]::SetEnvironmentVariable('JIRA_HOST', 'https://your-domain.atlassian.net', 'User')
[System.Environment]::SetEnvironmentVariable('JIRA_EMAIL', 'your-email@example.com', 'User')
[System.Environment]::SetEnvironmentVariable('JIRA_API_TOKEN', 'your-api-token', 'User')
```

**Windows (CMD):**
```cmd
setx JIRA_HOST "https://your-domain.atlassian.net"
setx JIRA_EMAIL "your-email@example.com"
setx JIRA_API_TOKEN "your-api-token"
```

**macOS/Linux:**
```bash
echo 'export JIRA_HOST="https://your-domain.atlassian.net"' >> ~/.bashrc
echo 'export JIRA_EMAIL="your-email@example.com"' >> ~/.bashrc
echo 'export JIRA_API_TOKEN="your-api-token"' >> ~/.bashrc
source ~/.bashrc
```

### Option B: VS Code Settings
Add to `.vscode/settings.json` (⚠️ Don't commit secrets!):
```json
{
  "terminal.integrated.env.windows": {
    "JIRA_HOST": "https://your-domain.atlassian.net",
    "JIRA_EMAIL": "your-email@example.com",
    "JIRA_API_TOKEN": "your-api-token"
  }
}
```

## Step 3: Verify Configuration

Restart VS Code, then test in chat:
```
@requirements-analyst Fetch ticket PROJ-123
```

## Available Jira Prompts

| Prompt | Usage | Description |
|--------|-------|-------------|
| `/jira-requirements` | `/jira-requirements PROJ-123` | Generate requirements from ticket |
| `/jira-review` | `/jira-review PROJ-123` | Code review linked to ticket |
| `/jira-test` | `/jira-test PROJ-123` | Generate tests from acceptance criteria |
| `/jira-security` | `/jira-security PROJ-123` | Security audit with Jira tracking |
| `/jira-release` | `/jira-release v1.2.0` | Release notes from fixVersion |

## Jira-Enhanced Agents

All R&R agents now support Jira integration:

| Agent | Jira Capabilities |
|-------|-------------------|
| `@requirements-analyst` | Fetch tickets, update acceptance criteria |
| `@code-reviewer` | Link reviews to tickets, post findings |
| `@test-engineer` | Generate tests from criteria, post results |
| `@security-auditor` | Create vulnerability tickets, update status |
| `@deployment-engineer` | Query releases, generate release notes |

## Example Workflows

### Ticket-Driven Development
```
1. /jira-requirements PROJ-123
   → Generates requirements doc from Jira

2. [Implement feature]

3. /jira-review PROJ-123
   → Reviews code, posts findings to Jira

4. /jira-test PROJ-123
   → Creates tests from acceptance criteria

5. /jira-security PROJ-123
   → Audits security, creates vuln tickets

6. /jira-release v1.0.0
   → Generates release notes from all tickets
```

### Quick Ticket Reference
```
@requirements-analyst What are the requirements for PROJ-123?
@test-engineer Write tests for PROJ-123 acceptance criteria
@deployment-engineer What tickets are in release v2.0?
```

## Troubleshooting

### "Jira tools not available"
- Restart VS Code after setting environment variables
- Check MCP server is enabled in settings
- Verify `.vscode/mcp.json` exists

### "Authentication failed"
- Verify `JIRA_HOST` includes `https://`
- Check API token is valid
- For Cloud: use email + API token
- For Server: use username + PAT

### "Permission denied"
- Ensure API token has read/write access
- Check project permissions in Jira
- Verify user can access the project

## Security Notes

⚠️ **Never commit API tokens to version control**

- Use environment variables for credentials
- Add `.vscode/settings.json` to `.gitignore` if it contains secrets
- Rotate API tokens periodically
- Use least-privilege permissions
