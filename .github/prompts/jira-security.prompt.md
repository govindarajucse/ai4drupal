---
description: "Security audit with Jira ticket tracking for vulnerability management"
name: "Jira Security Audit"
agent: "Security Auditor"
argument-hint: "Jira ticket key or 'create' to log new vulnerabilities"
tools: [read, search, jira/*]
---
Perform security audit and manage findings in Jira:

## Instructions

1. **Context from Jira** (if ticket provided):
   - Fetch ticket scope
   - Get related code changes
   - Check security requirements

2. **Perform Audit**: Complete security assessment:
   - OWASP Top 10 checks
   - Drupal-specific vulnerabilities
   - Dependency vulnerabilities

3. **Manage Findings in Jira**:
   
   **For existing ticket**: Add security findings as:
   - Subtasks for each vulnerability
   - Comments with severity ratings
   - Labels: `security`, `vulnerability`

   **For new vulnerabilities**: Create tickets:
   - Type: Bug (Security)
   - Priority based on CVSS
   - Include remediation steps

4. **Update Ticket Status**:
   - Pass → Add "security-approved" label
   - Fail → Block with linked security tickets

## Output Format
```
## Security Audit: {TICKET_KEY}

### Status: {Passed | Failed | Blocked}

### Jira Actions
- Created: {list of new tickets}
- Updated: {ticket with findings}

### Vulnerabilities
| Severity | Issue | Jira Ticket |
|----------|-------|-------------|
| {sev}    | {desc}| {PROJ-XXX}  |
```
