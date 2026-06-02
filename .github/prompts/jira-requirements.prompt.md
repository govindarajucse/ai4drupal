---
description: "Pull Jira ticket details and generate requirements documentation for R&R SDLC"
name: "Jira Requirements"
agent: "Requirements Analyst"
argument-hint: "Jira ticket key (e.g., PROJ-123)"
tools: [read, search, jira/*]
---
Fetch the Jira ticket and generate comprehensive requirements documentation:

## Instructions

1. **Fetch Ticket**: Use Jira MCP to get ticket details:
   - Summary and description
   - Acceptance criteria (if present)
   - Linked issues
   - Comments and attachments

2. **Analyze Requirements**: Extract and structure:
   - Functional requirements
   - Non-functional requirements
   - Dependencies
   - Constraints

3. **Search Codebase**: Find related:
   - Existing implementations
   - Similar patterns
   - Affected modules

4. **Generate Documentation**: Create requirements doc with:
   - User stories in proper format
   - Acceptance criteria (Given/When/Then)
   - Technical considerations
   - Risk assessment

5. **Update Jira**: Add acceptance criteria back to ticket as comment

## Output
Provide structured requirements document following the R&R methodology.
