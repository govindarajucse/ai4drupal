---
description: "Generate test cases from Jira acceptance criteria and report results back"
name: "Jira Test Plan"
agent: "Test Engineer"
argument-hint: "Jira ticket key (e.g., PROJ-123)"
tools: [read, search, edit, execute, jira/*]
---
Create test plan from Jira ticket and sync test results:

## Instructions

1. **Fetch Ticket**: Get acceptance criteria from Jira:
   - Parse Given/When/Then scenarios
   - Extract test conditions
   - Identify edge cases from comments

2. **Generate Test Plan**: Create comprehensive tests:
   - Map each acceptance criterion to test case
   - Add edge cases and error scenarios
   - Determine test type (Unit/Kernel/Functional)

3. **Write Tests**: Create test code:
   - Follow Drupal testing conventions
   - Include ticket reference in docblock
   - Name tests descriptively

4. **Execute Tests**: Run the test suite:
   ```bash
   phpunit --filter={TicketKey}
   ```

5. **Update Jira**: Post test results:
   - Test pass/fail status
   - Coverage metrics
   - Link to test files

## Output Format
```
## Test Report: {TICKET_KEY}

### Test Results
- Passed: {count}
- Failed: {count}
- Coverage: {percentage}%

### Test Files Created
- {file_path}

### Jira Updated
- Test results posted as comment
- Status updated to {status}
```
