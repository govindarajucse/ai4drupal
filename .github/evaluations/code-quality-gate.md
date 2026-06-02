# Code Quality Gate

## Purpose
Ensures all code meets Drupal coding standards and quality thresholds before proceeding to the next SDLC phase.

## Gate Criteria

### Mandatory (Blocking)
| Criterion | Tool | Threshold | Status |
|-----------|------|-----------|--------|
| PHPCS Errors | phpcs | 0 errors | ⬜ |
| PHPStan Errors | phpstan | 0 errors (level 6) | ⬜ |
| Syntax Errors | php -l | 0 errors | ⬜ |

### Recommended (Warning)
| Criterion | Tool | Threshold | Status |
|-----------|------|-----------|--------|
| PHPCS Warnings | phpcs | < 10 warnings | ⬜ |
| Cyclomatic Complexity | phpmd | < 10 per method | ⬜ |
| Code Duplication | phpcpd | < 5% | ⬜ |

## Validation Commands

```bash
# PHPCS Check
phpcs --standard=Drupal,DrupalPractice \
  --extensions=php,module,inc,install,test,profile,theme \
  web/modules/custom/

# PHPStan Check
phpstan analyse web/modules/custom/ --level=6

# Syntax Check
find web/modules/custom/ -name "*.php" -exec php -l {} \;
```

## Pass Criteria
- [ ] Zero PHPCS errors
- [ ] Zero PHPStan errors at level 6
- [ ] No PHP syntax errors
- [ ] Docblocks on all public methods
- [ ] Proper file headers

## Remediation

### Common PHPCS Issues
- Missing docblocks → Add `/** */` comments
- Line length > 80 → Break long lines
- Incorrect indentation → Use 2 spaces

### Common PHPStan Issues
- Missing types → Add type hints
- Undefined variables → Initialize variables
- Wrong parameter types → Fix method signatures

## Score Calculation
```
Score = 100 - (PHPCS_errors * 5) - (PHPStan_errors * 5) - (warnings * 1)
Pass = Score >= 90
```
