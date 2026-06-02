---
description: "Generate a comprehensive test plan and test code for a Drupal feature or module"
name: "Test Plan Generator"
agent: "test-engineer"
argument-hint: "Feature or module to test"
---
Create a comprehensive test plan including:

## Test Plan Components

### 1. Test Scenarios
- **Happy Path**: Normal user workflows
- **Edge Cases**: Boundary conditions
- **Error Handling**: Invalid inputs, failures
- **Permissions**: Access control verification

### 2. Test Types Required
Determine appropriate test types:
- **Unit Tests**: Pure PHP logic
- **Kernel Tests**: Services, entities, plugins
- **Functional Tests**: User interactions
- **FunctionalJS Tests**: JavaScript behaviors

### 3. Test Files to Create
List all test files with locations:
```
tests/src/Unit/
tests/src/Kernel/
tests/src/Functional/
tests/src/FunctionalJavascript/
```

### 4. Test Code
Generate actual test code following:
- Drupal testing conventions
- Data providers for multiple scenarios
- Clear test method names
- Proper assertions

### 5. Coverage Targets
- Line coverage target: 80%
- Branch coverage target: 70%
- Critical path coverage: 100%

### 6. Test Data
Document required:
- Test fixtures
- Mock objects
- Sample data

## Output
Provide complete test plan with executable test code.
