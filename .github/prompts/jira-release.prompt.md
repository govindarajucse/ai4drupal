---
description: "Generate release notes from Jira tickets and update release tracking"
name: "Jira Release Notes"
agent: "Deployment Engineer"
argument-hint: "Release version or Jira fixVersion (e.g., v1.2.0)"
tools: [read, search, execute, jira/*]
---
Generate release documentation from Jira and prepare deployment:

## Instructions

1. **Query Jira**: Fetch all tickets for the release:
   - Filter by fixVersion or label
   - Get ticket summaries and types
   - Identify blockers or incomplete tickets

2. **Categorize Changes**:
   - Features (Story, Epic)
   - Bug Fixes (Bug)
   - Improvements (Task, Improvement)
   - Breaking Changes

3. **Generate Release Notes**:
   ```markdown
   # Release {version}
   
   ## Features
   - {TICKET}: {Summary}
   
   ## Bug Fixes
   - {TICKET}: {Summary}
   
   ## Breaking Changes
   - {Description}
   ```

4. **Create Deployment Plan**: Based on ticket scope:
   - Config changes needed
   - Database updates
   - Module dependencies

5. **Update Jira**: 
   - Mark tickets as "Ready for Release"
   - Add release notes link to version

## Output
Complete release documentation with Jira traceability.
