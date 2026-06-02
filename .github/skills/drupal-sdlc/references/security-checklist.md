# Security Checklist Reference

## Pre-Development Security

### Requirements Phase
- [ ] Security requirements identified
- [ ] Data classification defined
- [ ] Privacy requirements documented
- [ ] Compliance requirements (GDPR, HIPAA, etc.)
- [ ] Authentication/authorization needs

## Development Security

### Input Handling
```php
// ❌ NEVER
$name = $_GET['name'];
$sql = "SELECT * FROM users WHERE name = '$name'";

// ✅ ALWAYS
$name = $request->query->get('name');
$query = $this->database->select('users', 'u')
  ->condition('name', $name)
  ->execute();
```

### Output Encoding
```php
// Plain text output
$safe = Html::escape($user_input);

// HTML output (filtered)
$safe_html = Xss::filter($html_input);

// Admin HTML (more permissive)
$admin_html = Xss::filterAdmin($admin_input);

// URL handling
$safe_url = UrlHelper::stripDangerousProtocols($url);
```

### Database Queries
```php
// Parameterized query
$this->database->query(
  'SELECT * FROM {table} WHERE id = :id',
  [':id' => $id]
);

// Query builder
$this->database->select('table', 't')
  ->fields('t')
  ->condition('id', $id)
  ->execute();

// LIKE patterns
$this->database->select('table', 't')
  ->condition('name', $this->database->escapeLike($search) . '%', 'LIKE');
```

### Access Control
```yaml
# Route permission
my_module.admin:
  requirements:
    _permission: 'administer my_module'

# Entity access
my_module.view:
  requirements:
    _entity_access: 'node.view'

# Custom access
my_module.custom:
  requirements:
    _custom_access: '\Drupal\my_module\Access\CustomAccess::access'
```

### File Uploads
```php
$validators = [
  'file_validate_extensions' => ['pdf doc docx'],
  'file_validate_size' => [25 * 1024 * 1024],
];

$file = file_save_upload('file', $validators, 'private://uploads');
```

## OWASP Top 10 Checklist

### A01: Broken Access Control
- [ ] All routes have access requirements
- [ ] Entity access checked for all operations
- [ ] No direct object references exposed
- [ ] CORS properly configured

### A02: Cryptographic Failures
- [ ] HTTPS enforced
- [ ] Sensitive data encrypted at rest
- [ ] No MD5/SHA1 for passwords
- [ ] Secure session management

### A03: Injection
- [ ] All database queries parameterized
- [ ] No OS command injection
- [ ] XSS prevention in all output
- [ ] LDAP injection prevented

### A04: Insecure Design
- [ ] Threat modeling completed
- [ ] Security requirements defined
- [ ] Fail-safe defaults
- [ ] Defense in depth

### A05: Security Misconfiguration
- [ ] Debug mode disabled
- [ ] Error messages generic
- [ ] Unnecessary features disabled
- [ ] Security headers set

### A06: Vulnerable Components
- [ ] Dependencies up to date
- [ ] No known CVEs
- [ ] Regular security updates
- [ ] Composer audit clean

### A07: Authentication Failures
- [ ] Strong password policy
- [ ] Brute force protection
- [ ] Session timeout configured
- [ ] MFA available

### A08: Data Integrity Failures
- [ ] Code signing verified
- [ ] Update integrity checked
- [ ] CI/CD pipeline secured
- [ ] Dependencies verified

### A09: Logging Failures
- [ ] Security events logged
- [ ] Logs protected
- [ ] No sensitive data in logs
- [ ] Monitoring alerts configured

### A10: SSRF
- [ ] URL validation
- [ ] Allowlist for external requests
- [ ] No user-controlled redirects
- [ ] Internal network protected

## Security Testing Commands

```bash
# Check Drupal security updates
drush pm:security

# Check composer vulnerabilities
composer audit

# Run PHPCS security sniffs
phpcs --standard=Drupal web/modules/custom/

# PHPStan security rules
phpstan analyse --level=6 web/modules/custom/
```

## Incident Response

### If Vulnerability Found
1. Document the vulnerability
2. Assess impact and likelihood
3. Create remediation plan
4. Implement fix
5. Verify fix effectiveness
6. Update security documentation
