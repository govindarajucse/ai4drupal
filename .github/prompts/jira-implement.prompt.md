---
description: "Implement Drupal features from Jira tickets with full code generation"
name: "Jira Implementation"
agent: "Implementation Assistant"
argument-hint: "Jira ticket key (e.g., PROJ-123)"
tools: [read, search, edit, execute, jira/*]
---
Implement a Drupal feature based on a Jira ticket:

## Instructions

1. **Fetch Ticket**: Get full details from Jira:
   - Summary and description
   - Acceptance criteria
   - Technical notes
   - Linked design docs

2. **Check Requirements**: Verify requirements are complete:
   - If incomplete, suggest running `/jira-requirements` first
   - Extract implementable specifications

3. **Search Codebase**: Find related code:
   - Similar implementations
   - Reusable services/utilities
   - Project patterns to follow

4. **Implement Feature**: Generate code following:
   - Drupal coding standards
   - Project instructions files
   - Security best practices
   - Test considerations

5. **Update Jira**: Post implementation notes:
   - Files created/modified
   - Key decisions made
   - Testing instructions

## Output
Working Drupal code with proper structure, documentation, and test stubs.
