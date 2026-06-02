---
description: "Use when creating or modifying Drupal modules, services, plugins, controllers, or hooks. Covers module structure, dependency injection, and Drupal best practices."
applyTo: "web/modules/custom/**/*.php"
---
# Drupal Module Guidelines

## Module Structure
```
my_module/
├── my_module.info.yml          # Module definition
├── my_module.module            # Procedural hooks only
├── my_module.services.yml      # Service definitions
├── my_module.routing.yml       # Route definitions
├── my_module.permissions.yml   # Permission definitions
├── my_module.links.menu.yml    # Menu links
├── config/
│   ├── install/                # Default config
│   └── schema/                 # Config schema
├── src/
│   ├── Controller/             # Route controllers
│   ├── Form/                   # Form classes
│   ├── Plugin/                 # Plugin implementations
│   ├── Service/                # Service classes
│   └── EventSubscriber/        # Event subscribers
├── templates/                  # Twig templates
└── tests/                      # Test classes
```

## Service Definition
```yaml
# my_module.services.yml
services:
  my_module.my_service:
    class: Drupal\my_module\Service\MyService
    arguments: ['@entity_type.manager', '@database']
    tags:
      - { name: service_collector_tag }
```

## Dependency Injection Pattern
```php
namespace Drupal\my_module\Service;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Database\Connection;

class MyService {

  public function __construct(
    private readonly EntityTypeManagerInterface $entityTypeManager,
    private readonly Connection $database,
  ) {}

  public function loadNodes(array $nids): array {
    return $this->entityTypeManager
      ->getStorage('node')
      ->loadMultiple($nids);
  }
}
```

## Plugin Pattern (Block Example)
```php
namespace Drupal\my_module\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Plugin\ContainerFactoryPluginInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Provides a custom block.
 *
 * @Block(
 *   id = "my_module_custom_block",
 *   admin_label = @Translation("My Custom Block"),
 *   category = @Translation("Custom")
 * )
 */
class CustomBlock extends BlockBase implements ContainerFactoryPluginInterface {

  public static function create(
    ContainerInterface $container,
    array $configuration,
    $plugin_id,
    $plugin_definition
  ): static {
    return new static(
      $configuration,
      $plugin_id,
      $plugin_definition,
    );
  }

  public function build(): array {
    return [
      '#markup' => $this->t('Hello World'),
    ];
  }
}
```

## Controller Pattern
```php
namespace Drupal\my_module\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\JsonResponse;

class MyController extends ControllerBase {

  public function content(): array {
    return [
      '#theme' => 'my_template',
      '#data' => $this->getData(),
    ];
  }

  public function api(): JsonResponse {
    return new JsonResponse(['status' => 'ok']);
  }
}
```

## Best Practices
- Use `final` classes unless inheritance is intended
- Prefer constructor property promotion (PHP 8+)
- Use `readonly` for immutable dependencies
- Implement interfaces for testability
- Use `#[Attribute]` syntax for PHP 8+ plugins
- Keep `.module` files minimal (hooks only)
- Use event subscribers over hooks when possible
