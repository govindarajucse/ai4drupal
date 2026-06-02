# Documentation Gate

## Purpose
Ensures adequate documentation for code maintainability and onboarding.

## Gate Criteria

### Mandatory
| Criterion | Requirement | Status |
|-----------|-------------|--------|
| README.md | Exists and complete | ⬜ |
| Public Method Docblocks | 100% coverage | ⬜ |
| Service Documentation | All services documented | ⬜ |

### Recommended
| Criterion | Requirement | Status |
|-----------|-------------|--------|
| CHANGELOG.md | Updated with changes | ⬜ |
| API Documentation | For public APIs | ⬜ |
| Architecture Docs | For complex features | ⬜ |

## README.md Checklist

### Required Sections
- [ ] **Description**: What the module does
- [ ] **Requirements**: Dependencies and versions
- [ ] **Installation**: Step-by-step install
- [ ] **Configuration**: How to configure
- [ ] **Usage**: How to use the module

### Recommended Sections
- [ ] **API**: Programmatic usage
- [ ] **Troubleshooting**: Common issues
- [ ] **Contributing**: How to contribute
- [ ] **License**: License information

## Docblock Standards

### Class Docblock
```php
/**
 * Provides a service for handling X.
 *
 * This service is responsible for:
 * - Task 1
 * - Task 2
 *
 * @package Drupal\my_module\Service
 */
```

### Method Docblock
```php
/**
 * Performs the action.
 *
 * @param string $input
 *   The input string to process.
 * @param array $options
 *   (optional) Configuration options.
 *
 * @return array
 *   The processed result.
 *
 * @throws \InvalidArgumentException
 *   When input is invalid.
 */
```

## Validation Commands

```bash
# Check for missing docblocks
phpcs --standard=Drupal web/modules/custom/ \
  --sniffs=Drupal.Commenting.DocComment,Drupal.Commenting.FunctionComment

# Verify README exists
test -f web/modules/custom/MODULE/README.md && echo "README exists"

# Generate documentation (if using phpDocumentor)
phpdoc -d web/modules/custom/ -t docs/api/
```

## Documentation Checklist

### Module Documentation
- [ ] README.md present and complete
- [ ] Installation instructions work
- [ ] Configuration steps accurate
- [ ] Examples provided

### Code Documentation
- [ ] All public classes documented
- [ ] All public methods documented
- [ ] Complex private methods documented
- [ ] @param, @return, @throws annotations

### API Documentation
- [ ] Endpoints documented
- [ ] Request/response formats shown
- [ ] Error responses documented
- [ ] Authentication explained

## Pass Criteria
- [ ] README.md complete
- [ ] 100% public method docblock coverage
- [ ] No TODO comments in production code
- [ ] Changelog updated (if applicable)

## Score Calculation
```
Score = (readme_complete * 30) + (docblock_coverage * 50) + (api_docs * 20)
Pass = Score >= 70
```
