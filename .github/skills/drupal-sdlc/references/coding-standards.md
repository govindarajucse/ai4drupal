# Drupal Coding Standards Reference

## PHP Standards

### File Header
```php
<?php

declare(strict_types=1);

namespace Drupal\my_module;

/**
 * @file
 * Contains \Drupal\my_module\ClassName.
 */
```

### Class Documentation
```php
/**
 * Provides a service for handling X.
 *
 * This service is responsible for:
 * - Task 1
 * - Task 2
 */
final class MyService {
```

### Method Documentation
```php
/**
 * Performs the action.
 *
 * @param string $input
 *   The input string to process.
 * @param array $options
 *   (optional) An array of options:
 *   - key: Description of option.
 *
 * @return array
 *   The processed result containing:
 *   - data: The processed data.
 *   - status: The status code.
 *
 * @throws \InvalidArgumentException
 *   When input is empty.
 */
public function process(string $input, array $options = []): array {
```

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Classes | PascalCase | `MyServiceClass` |
| Methods | camelCase | `processData()` |
| Variables | snake_case | `$user_data` |
| Constants | UPPER_SNAKE | `MY_CONSTANT` |
| Hooks | snake_case | `hook_entity_presave` |
| Files | snake_case | `my_module.module` |

## Service Definition
```yaml
services:
  my_module.service_name:
    class: Drupal\my_module\Service\ServiceName
    arguments:
      - '@entity_type.manager'
      - '@database'
    tags:
      - { name: event_subscriber }
```

## Dependency Injection
```php
// CORRECT: Constructor injection
public function __construct(
  private readonly EntityTypeManagerInterface $entityTypeManager,
  private readonly Connection $database,
) {}

// INCORRECT: Static service calls
$service = \Drupal::service('my_service');
```

## Form API
```php
$form['field'] = [
  '#type' => 'textfield',
  '#title' => $this->t('Label'),
  '#description' => $this->t('Help text.'),
  '#required' => TRUE,
  '#default_value' => $config->get('field'),
];
```

## Render Arrays
```php
return [
  '#theme' => 'my_template',
  '#data' => $data,
  '#cache' => [
    'contexts' => ['user'],
    'tags' => ['node_list'],
    'max-age' => 3600,
  ],
];
```

## Running Standards Check
```bash
# Check standards
phpcs --standard=Drupal,DrupalPractice web/modules/custom/

# Auto-fix issues
phpcbf --standard=Drupal web/modules/custom/

# PHPStan analysis
phpstan analyse web/modules/custom/ --level=6
```
