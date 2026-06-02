---
description: "Generate a new Drupal custom module with proper structure, services, and configuration"
name: "Drupal Module Generator"
agent: "agent"
argument-hint: "Module name and purpose (e.g., 'event_booking - handles event reservations')"
---
Generate a complete Drupal custom module with the following structure:

## Required Files

1. **{module_name}.info.yml** - Module definition with:
   - name, type, description
   - core_version_requirement: ^10 || ^11
   - package: Custom
   - dependencies (if any)

2. **{module_name}.module** - Procedural hooks:
   - `hook_help()` implementation
   - Minimal procedural code

3. **{module_name}.services.yml** - Service definitions:
   - Main service class
   - Proper dependency injection
   - Service tags if applicable

4. **src/Service/{ServiceName}.php** - Main service:
   - Constructor dependency injection
   - Proper typing and docblocks

5. **README.md** - Documentation:
   - Installation instructions
   - Configuration steps
   - Usage examples

## Standards
- Follow Drupal coding standards (PSR-12 with Drupal extensions)
- Use PHP 8.2+ features (constructor promotion, readonly, typed properties)
- Include proper docblocks
- Namespace: `Drupal\{module_name}`

## Location
Create in: `web/modules/custom/{module_name}/`
