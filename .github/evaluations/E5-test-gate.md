# E5: TEST Gate Evaluation

## Purpose
Evaluates test coverage, QA results, and security testing before RELEASE phase.

## Scoring Criteria

### Test Coverage (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| Overall coverage ≥80% | 30 |
| Unit tests present | 15 |
| Kernel tests present | 15 |
| Functional tests present | 15 |
| **Subtotal** | 75 |

### Test Quality (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| All tests passing | 25 |
| Edge cases covered | 15 |
| Error scenarios tested | 15 |
| Performance tests (if needed) | 10 |
| **Subtotal** | 65 |

### Acceptance Criteria (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| All AC verified | 30 |
| AC mapped to tests | 15 |
| UAT scenarios passed | 15 |
| **Subtotal** | 60 |

### Security Testing (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| No SQL injection vulnerabilities | 20 |
| No XSS vulnerabilities | 20 |
| Access control verified | 15 |
| CSRF protection verified | 10 |
| **Subtotal** | 65 |

### Regression (Weight: 1.0x)
| Criteria | Points |
|----------|--------|
| Existing tests still pass | 15 |
| No new warnings | 10 |
| **Subtotal** | 25 |

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| ≥85% | **PASS** | Proceed to RELEASE |
| 75-84% | **PARTIAL** | Add missing tests |
| <75% | **FAIL** | Return to CODE/BUILD |

## Automated Testing

```bash
# Run all tests with coverage
./vendor/bin/phpunit \
  --coverage-html coverage/ \
  --coverage-clover coverage.xml \
  web/modules/custom/my_module

# Check coverage threshold
./vendor/bin/phpunit --coverage-php coverage.php
php -r "require 'coverage.php'; if (\$coverage < 80) exit(1);"

# Security scan
./vendor/bin/phpcs --standard=DrupalPractice web/modules/custom/
./vendor/bin/drupal-check --no-progress web/modules/custom/
```

## Coverage Requirements

| Test Type | Minimum |
|-----------|---------|
| Unit | 80% |
| Kernel | 70% |
| Functional | Key paths |

## Evaluation Checklist

```markdown
## E5 Gate Checklist

### Test Coverage
- [ ] Unit coverage ≥80%
- [ ] Critical paths tested
- [ ] Edge cases covered

### Test Results
- [ ] All tests passing
- [ ] No flaky tests
- [ ] Performance acceptable

### Acceptance Criteria
- [ ] All AC have corresponding tests
- [ ] UAT scenarios verified
- [ ] Business logic validated

### Security
- [ ] SQL injection: PASS
- [ ] XSS: PASS
- [ ] CSRF: PASS
- [ ] Access control: PASS

### Ready for RELEASE?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```

## Test Artifacts

1. **Test Results Report**
2. **Coverage Report** (HTML + XML)
3. **Security Scan Report**
4. **Bug List** (if any found)
