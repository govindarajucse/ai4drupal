---
description: "Create Drupal migration scripts for importing data from external sources or legacy systems"
name: "Drupal Migration Generator"
agent: "agent"
argument-hint: "Source and destination (e.g., 'CSV users to Drupal users')"
---
Create a Drupal migration configuration and supporting code:

## Migration Components

### 1. Migration Configuration
Create `config/install/migrate_plus.migration.{migration_id}.yml`:

```yaml
id: {migration_id}
label: '{Description}'
migration_group: {group}
source:
  plugin: {source_plugin}
  # Source configuration
process:
  # Field mappings
destination:
  plugin: {destination_plugin}
migration_dependencies:
  required: []
  optional: []
```

### 2. Source Plugin (if custom)
Create `src/Plugin/migrate/source/{SourceName}.php`:
- Extend appropriate base class
- Implement `query()` or `initializeIterator()`
- Define `fields()` and `getIds()`

### 3. Process Plugin (if custom)
Create `src/Plugin/migrate/process/{ProcessName}.php`:
- Extend `ProcessPluginBase`
- Implement `transform()` method

### 4. Migration Commands
Document drush commands:
```bash
drush migrate:import {migration_id}
drush migrate:rollback {migration_id}
drush migrate:status
```

## Standards
- Use Migrate API best practices
- Include rollback support
- Handle errors gracefully
- Log migration progress
- Validate source data

## Testing
Include migration test with sample data.
