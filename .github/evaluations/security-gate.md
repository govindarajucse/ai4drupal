# Security Gate

## Purpose
Ensures all code is free from security vulnerabilities before deployment.

## Gate Criteria

### Critical (Blocking - Must Fix)
| Criterion | Category | Threshold | Status |
|-----------|----------|-----------|--------|
| SQL Injection | A03:Injection | 0 issues | ⬜ |
| XSS Vulnerabilities | A03:Injection | 0 issues | ⬜ |
| Broken Access Control | A01:Access | 0 issues | ⬜ |
| Authentication Bypass | A07:Auth | 0 issues | ⬜ |

### High (Blocking - Must Mitigate)
| Criterion | Category | Threshold | Status |
|-----------|----------|-----------|--------|
| CSRF Missing | A01:Access | 0 issues | ⬜ |
| Sensitive Data Exposure | A02:Crypto | 0 issues | ⬜ |
| Insecure Dependencies | A06:Components | 0 critical | ⬜ |

### Medium (Warning)
| Criterion | Category | Threshold | Status |
|-----------|----------|-----------|--------|
| Missing Input Validation | A03:Injection | < 5 | ⬜ |
| Insufficient Logging | A09:Logging | < 3 | ⬜ |
| Configuration Issues | A05:Misconfig | < 5 | ⬜ |

## Validation Commands

```bash
# Check for security updates
drush pm:security

# Composer vulnerability check
composer audit

# Run security scan script
./.github/hooks/scripts/security-scan.sh

# Check for dangerous patterns
grep -rn '\$_GET\|\$_POST' web/modules/custom/ --include="*.php"
```

## OWASP Checklist

### A01: Broken Access Control
- [ ] All routes have access requirements
- [ ] Entity access checked
- [ ] No IDOR vulnerabilities

### A02: Cryptographic Failures
- [ ] HTTPS enforced
- [ ] Passwords properly hashed
- [ ] No sensitive data in logs

### A03: Injection
- [ ] All queries parameterized
- [ ] Output properly escaped
- [ ] No eval() usage

### A05: Security Misconfiguration
- [ ] Debug mode disabled
- [ ] Error messages sanitized
- [ ] Unnecessary modules disabled

### A06: Vulnerable Components
- [ ] Drupal core up to date
- [ ] Contributed modules patched
- [ ] No known CVEs

## Pass Criteria
- [ ] Zero critical vulnerabilities
- [ ] Zero high vulnerabilities (or documented mitigation)
- [ ] Security headers configured
- [ ] Dependencies audit clean

## Score Calculation
```
Score = 100 - (critical * 25) - (high * 10) - (medium * 3) - (low * 1)
Pass = Score >= 90 AND critical == 0
```
