---
description: "Perform a comprehensive code review following R&R standards and Drupal best practices"
name: "Code Review"
agent: "code-reviewer"
argument-hint: "Files, module, or feature to review"
---
Perform a comprehensive code review covering:

## Review Scope
Analyze the specified files or module for:

### 1. Drupal Standards Compliance
- PSR-12 with Drupal extensions
- Proper docblocks and annotations
- File structure and naming

### 2. Security Vulnerabilities
- Input validation and sanitization
- Output escaping
- SQL injection prevention
- Access control implementation
- CSRF protection

### 3. Performance Concerns
- Caching implementation
- Query efficiency
- N+1 query patterns
- Lazy loading

### 4. Code Quality
- Single responsibility principle
- Dependency injection usage
- Error handling
- Code duplication

### 5. Test Coverage
- Unit test coverage
- Integration tests
- Edge case handling

### 6. Documentation
- README completeness
- Inline documentation
- API documentation

## Output
Provide review in the standard format with:
- Critical issues (must fix)
- Warnings (should fix)
- Suggestions (nice to have)
- Positive observations

Include specific file and line references for all findings.
