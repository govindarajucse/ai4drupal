# E3: CODE Gate Evaluation

## Purpose
Evaluates architecture decisions and implementation quality before BUILD phase.

## Scoring Criteria

### Architecture Documentation (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| ADRs documented | 15 |
| Data model defined | 15 |
| API contracts specified | 10 |
| Integration points documented | 10 |
| **Subtotal** | 50 |

### Code Standards (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| PHPCS passes (no errors) | 25 |
| PHPStan level 6+ passes | 25 |
| Drupal coding standards followed | 20 |
| Proper namespacing | 10 |
| **Subtotal** | 80 |

### Implementation Quality (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| Dependency injection used | 15 |
| Services properly defined | 10 |
| Plugins over hooks | 10 |
| Configuration schemas created | 10 |
| **Subtotal** | 45 |

### Security Compliance (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| Parameterized queries | 20 |
| Output sanitization | 20 |
| Form API for CSRF | 15 |
| Permission checks | 15 |
| **Subtotal** | 70 |

### Test Preparation (Weight: 1.0x)
| Criteria | Points |
|----------|--------|
| Test stubs created | 10 |
| Testable code structure | 10 |
| Mocking points identified | 5 |
| **Subtotal** | 25 |

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| ≥85% | **PASS** | Proceed to BUILD |
| 75-84% | **PARTIAL** | Fix specific issues |
| <75% | **FAIL** | Return to CODE |

## Automated Checks

```bash
# PHPCS
./vendor/bin/phpcs --standard=Drupal,DrupalPractice web/modules/custom/

# PHPStan
./vendor/bin/phpstan analyze web/modules/custom/ --level=6

# Security check
./vendor/bin/phpcs --standard=DrupalPractice web/modules/custom/
```

## Evaluation Checklist

```markdown
## E3 Gate Checklist

### Architecture
- [ ] ADR documented for key decisions
- [ ] Data model matches requirements
- [ ] API contracts clear

### Code Standards
- [ ] PHPCS: 0 errors
- [ ] PHPStan level 6: 0 errors
- [ ] Drupal naming conventions

### Implementation
- [ ] Services use DI
- [ ] Plugins used appropriately
- [ ] Config schemas valid

### Security
- [ ] No SQL concatenation
- [ ] Output escaped
- [ ] Permissions checked

### Ready for BUILD?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```
