---
description: "Link code review findings to Jira ticket and update ticket status"
name: "Jira Code Review"
agent: "Code Reviewer"
argument-hint: "Jira ticket key (e.g., PROJ-123)"
tools: [read, search, jira/*]
---
Perform code review and sync findings with Jira:

## Instructions

1. **Fetch Ticket**: Get ticket details from Jira:
   - Linked branches/PRs
   - Acceptance criteria
   - Related issues

2. **Identify Changes**: Find code changes related to ticket:
   - Search for ticket key in comments
   - Check recent file modifications
   - Review linked commits

3. **Perform Review**: Execute full code review:
   - Drupal standards compliance
   - Security vulnerabilities
   - Performance concerns
   - Test coverage

4. **Update Jira**: Post review summary to ticket:
   - Critical issues found
   - Warnings and suggestions
   - Approval status

## Output Format
```
## Code Review: {TICKET_KEY}

### Status: {Approved | Changes Requested | Blocked}

### Findings Posted to Jira
- Critical: {count}
- Warnings: {count}

### Details
{Full review report}
```
