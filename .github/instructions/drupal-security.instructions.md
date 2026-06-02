---
description: "Use when reviewing security, handling user input, database queries, access control, or CSRF protection in Drupal. Critical for all PHP code changes."
applyTo: "**/*.php"
---
# Drupal Security Guidelines

## Input Sanitization

### NEVER Do This
```php
// VULNERABLE - Direct superglobal access
$name = $_GET['name'];
$data = $_POST['data'];

// VULNERABLE - Unsanitized output
echo $user_input;
print $variable;
```

### Always Do This
```php
// SAFE - Use Request object
$request = \Drupal::request();
$name = $request->query->get('name');
$data = $request->request->get('data');

// SAFE - Sanitize output
use Drupal\Component\Utility\Html;
use Drupal\Component\Utility\Xss;

$safe_output = Html::escape($user_input);
$safe_html = Xss::filter($html_input);
$safe_admin = Xss::filterAdmin($admin_html);
```

## Database Security

### NEVER Do This
```php
// VULNERABLE - SQL Injection
$query = "SELECT * FROM users WHERE name = '$name'";
$db->query($query);

// VULNERABLE - Concatenation
$db->query("SELECT * FROM {node} WHERE nid = " . $nid);
```

### Always Do This
```php
// SAFE - Parameterized queries
$result = $this->database->select('users', 'u')
  ->fields('u')
  ->condition('name', $name)
  ->execute();

// SAFE - Placeholders
$this->database->query(
  'SELECT * FROM {node} WHERE nid = :nid',
  [':nid' => $nid]
);

// SAFE - LIKE queries
$this->database->select('node', 'n')
  ->condition('title', $this->database->escapeLike($search) . '%', 'LIKE')
  ->execute();
```

## Access Control

### Route Access
```yaml
# my_module.routing.yml
my_module.admin:
  path: '/admin/config/my-module'
  defaults:
    _controller: '\Drupal\my_module\Controller\AdminController::settings'
    _title: 'Settings'
  requirements:
    _permission: 'administer my_module'

my_module.content:
  path: '/my-content/{node}'
  defaults:
    _controller: '\Drupal\my_module\Controller\ContentController::view'
  requirements:
    _entity_access: 'node.view'
```

### Programmatic Access Check
```php
use Drupal\Core\Access\AccessResult;

// Check permission
if (!$account->hasPermission('administer my_module')) {
  return AccessResult::forbidden();
}

// Entity access
$access = $node->access('update', $account, TRUE);
if (!$access->isAllowed()) {
  throw new AccessDeniedHttpException();
}
```

### Custom Access Checker
```php
namespace Drupal\my_module\Access;

use Drupal\Core\Access\AccessResult;
use Drupal\Core\Routing\Access\AccessInterface;
use Drupal\Core\Session\AccountInterface;

class CustomAccessChecker implements AccessInterface {

  public function access(AccountInterface $account): AccessResult {
    return AccessResult::allowedIf(
      $account->hasPermission('access my_module')
      && $this->additionalCheck($account)
    )->cachePerUser();
  }
}
```

## CSRF Protection

### Forms - Automatic Protection
```php
// Form API automatically adds CSRF tokens
// No manual intervention needed for standard forms

public function buildForm(array $form, FormStateInterface $form_state): array {
  $form['submit'] = [
    '#type' => 'submit',
    '#value' => $this->t('Submit'),
  ];
  return $form;
}
```

### AJAX/API Endpoints
```php
// For custom AJAX, verify CSRF token
use Drupal\Core\Access\CsrfTokenGenerator;

public function __construct(
  private readonly CsrfTokenGenerator $csrfToken,
) {}

public function handleAjax(Request $request): JsonResponse {
  $token = $request->headers->get('X-CSRF-Token');
  if (!$this->csrfToken->validate($token, 'my_module_ajax')) {
    throw new AccessDeniedHttpException('Invalid CSRF token');
  }
  // Process request
}
```

## File Upload Security
```php
// Validate file extensions
$validators = [
  'file_validate_extensions' => ['pdf doc docx'],
  'file_validate_size' => [25 * 1024 * 1024], // 25MB
];

// Use managed files, never raw uploads
$file = file_save_upload('file_field', $validators, 'private://uploads');

// Check MIME type
$mime_type = $file->getMimeType();
$allowed_mimes = ['application/pdf', 'application/msword'];
if (!in_array($mime_type, $allowed_mimes)) {
  throw new \Exception('Invalid file type');
}
```

## Security Checklist
- [ ] All user input sanitized before output
- [ ] All database queries use parameters
- [ ] Access control on all routes
- [ ] CSRF tokens for state-changing operations
- [ ] File uploads validated (type, size, extension)
- [ ] No hardcoded credentials
- [ ] Sensitive data in private file system
- [ ] Error messages don't expose internals
- [ ] Dependencies up to date (no known CVEs)
