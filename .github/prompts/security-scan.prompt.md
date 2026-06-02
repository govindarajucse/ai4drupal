---
description: "Run a security audit on Drupal code following OWASP guidelines"
name: "Security Scan"
agent: "security-auditor"
argument-hint: "Module or files to audit"
---
Perform a security audit covering:

## Audit Scope

### 1. OWASP Top 10 Checks
- A01: Broken Access Control
- A02: Cryptographic Failures
- A03: Injection (SQL, XSS)
- A04: Insecure Design
- A05: Security Misconfiguration
- A06: Vulnerable Components
- A07: Authentication Failures
- A08: Data Integrity Failures
- A09: Logging Failures
- A10: SSRF

### 2. Drupal-Specific Security
- Input sanitization (Html::escape, Xss::filter)
- Database API usage (no raw queries)
- Access control (permissions, entity access)
- Form API CSRF protection
- File upload security
- Session handling

### 3. Dependency Audit
- Check composer.lock for known vulnerabilities
- Verify Drupal core security updates
- Review contributed module versions

### 4. Configuration Review
- Debug mode settings
- Error display settings
- Trusted host patterns
- File permissions

## Output
Provide security report with:
- Vulnerability classifications (Critical/High/Medium/Low)
- OWASP categories
- CWE references
- Specific remediation steps
- Code examples for fixes
