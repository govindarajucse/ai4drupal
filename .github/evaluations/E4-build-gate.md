# E4: BUILD Gate Evaluation

## Purpose
Evaluates compilation, static analysis, and code review before TEST phase.

## Scoring Criteria

### Compilation (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| No PHP syntax errors | 30 |
| All classes autoload correctly | 20 |
| Services compile | 20 |
| No fatal errors on enable | 15 |
| **Subtotal** | 85 |

### Static Analysis (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| PHPCS: zero errors | 25 |
| PHPStan: zero errors | 25 |
| No deprecated code usage | 10 |
| **Subtotal** | 60 |

### Code Review (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| Self-review completed | 10 |
| Peer review passed | 20 |
| All comments addressed | 15 |
| Best practices followed | 10 |
| **Subtotal** | 55 |

### Standards Compliance (Weight: 1.0x)
| Criteria | Points |
|----------|--------|
| Documentation complete | 10 |
| Consistent code style | 10 |
| Proper commit messages | 5 |
| **Subtotal** | 25 |

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| ≥90% | **PASS** | Proceed to TEST |
| 80-89% | **PARTIAL** | Address review comments |
| <80% | **FAIL** | Return to CODE |

## Automated Verification

```bash
# Verify module can be enabled
drush pm:enable my_module -y

# Verify services compile
drush cr

# Run static analysis
composer run-script phpcs
composer run-script phpstan

# Check for deprecated code
./vendor/bin/drupal-check web/modules/custom/
```

## Review Checklist

### Code Review Focus Areas
- [ ] Logic correctness
- [ ] Error handling
- [ ] Edge cases
- [ ] Performance considerations
- [ ] Security implications
- [ ] Maintainability
- [ ] Documentation quality

## Evaluation Checklist

```markdown
## E4 Gate Checklist

### Compilation
- [ ] `drush cr` succeeds
- [ ] Module enables without errors
- [ ] No class not found errors

### Static Analysis
- [ ] PHPCS: 0 errors, 0 warnings
- [ ] PHPStan: 0 errors
- [ ] No deprecation warnings

### Code Review
- [ ] Self-review done
- [ ] Peer review approved
- [ ] Comments resolved

### Ready for TEST?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```
