---
description: "Use when working with Drupal configuration, config exports, config splits, or YAML configuration files. Covers config management best practices."
applyTo: ["config/**/*.yml", "**/config/install/**/*.yml", "**/config/schema/**/*.yml"]
---
# Drupal Configuration Guidelines

## Configuration Directory Structure
```
config/
├── sync/                       # Primary config sync directory
│   ├── system.site.yml         # Site settings
│   ├── core.extension.yml      # Enabled modules/themes
│   └── ...                     # All exported config
├── local/                      # Local dev overrides (config_split)
├── dev/                        # Development environment
├── staging/                    # Staging environment
└── prod/                       # Production environment
```

## Config Export/Import Commands
```bash
# Export all configuration
drush cex -y

# Import all configuration
drush cim -y

# Export single config
drush config:export --destination=/tmp/config

# Import single config
drush config:import --source=/tmp/config

# View config diff
drush config:status

# Get single config value
drush config:get system.site name
```

## Config Schema Definition
```yaml
# config/schema/my_module.schema.yml
my_module.settings:
  type: config_object
  label: 'My Module settings'
  mapping:
    enabled:
      type: boolean
      label: 'Enabled'
    api_endpoint:
      type: string
      label: 'API Endpoint'
    items_per_page:
      type: integer
      label: 'Items per page'
    allowed_types:
      type: sequence
      label: 'Allowed content types'
      sequence:
        type: string
        label: 'Content type'
```

## Default Configuration
```yaml
# my_module/config/install/my_module.settings.yml
enabled: true
api_endpoint: 'https://api.example.com'
items_per_page: 10
allowed_types:
  - article
  - page
```

## Config Override in settings.php
```php
// settings.php - Environment-specific overrides

// Disable caching on dev
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

// Override site mail
$config['system.site']['mail'] = 'dev@example.com';

// Override API endpoint per environment
$config['my_module.settings']['api_endpoint'] = getenv('API_ENDPOINT');
```

## Config Split Setup
```yaml
# config/sync/config_split.config_split.local.yml
uuid: generated-uuid
langcode: en
status: true
dependencies: {  }
id: local
label: Local
description: 'Local development configuration'
weight: 0
status_override: {  }
complete_list:
  - devel.settings
  - devel.toolbar.settings
conditional_list: {  }
```

## Configuration Entity Example
```php
namespace Drupal\my_module\Entity;

use Drupal\Core\Config\Entity\ConfigEntityBase;

/**
 * Defines the Example config entity.
 *
 * @ConfigEntityType(
 *   id = "example",
 *   label = @Translation("Example"),
 *   handlers = {
 *     "list_builder" = "Drupal\my_module\ExampleListBuilder",
 *     "form" = {
 *       "add" = "Drupal\my_module\Form\ExampleForm",
 *       "edit" = "Drupal\my_module\Form\ExampleForm",
 *       "delete" = "Drupal\Core\Entity\EntityDeleteForm"
 *     }
 *   },
 *   config_prefix = "example",
 *   admin_permission = "administer site configuration",
 *   entity_keys = {
 *     "id" = "id",
 *     "label" = "label"
 *   },
 *   config_export = {
 *     "id",
 *     "label",
 *     "description",
 *     "settings"
 *   }
 * )
 */
class Example extends ConfigEntityBase implements ExampleInterface {
  // Entity implementation
}
```

## Best Practices
- Always define config schema for validation
- Use config_split for environment-specific config
- Never commit sensitive data (API keys, passwords)
- Use settings.php overrides for secrets
- Review config changes before committing
- Test config import on fresh install
- Use UUIDs only in sync directory
- Document any manual config steps
