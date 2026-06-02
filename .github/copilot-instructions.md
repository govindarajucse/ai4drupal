# AI4Drupal Project Guidelines

## Code Style
- Follow Drupal Coding Standards (PSR-12 with Drupal extensions)
- Use PHP 8.2+ features where appropriate
- Namespace modules under `Drupal\{module_name}`
- Reference: `web/core/.eslintrc.json` for JS standards

## Architecture
- Custom modules in `web/modules/custom/`
- Custom themes in `web/themes/custom/`
- Configuration in `config/sync/`
- Composer-managed dependencies only

## Build & Test
- Install: `composer install && drush site:install`
- Build: `drush cr && drush updb -y`
- Test: `phpunit --group=custom` or `drush test:run`
- Lint: `phpcs --standard=Drupal,DrupalPractice`

## Conventions
- Services in `*.services.yml`, inject via constructor
- Plugins over hooks for new functionality
- Config entities for admin-configurable data
- Always include `hook_help()` for modules

## R&R SDLC Phases
1. **Requirements** → requirements-analyst agent
2. **Review** → code-reviewer agent
3. **Test** → test-engineer agent
4. **Security** → security-auditor agent
5. **Deploy** → deployment-engineer agent

## Database
- Use Database API with parameterized queries
- Never concatenate user input into SQL
- Migrations for schema changes

## Security
- Sanitize all output: `Html::escape()`, `Xss::filter()`
- Use Form API for CSRF protection
- Check permissions with `$account->hasPermission()`
