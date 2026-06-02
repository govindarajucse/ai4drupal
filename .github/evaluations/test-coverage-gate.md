# Test Coverage Gate

## Purpose
Ensures adequate test coverage for all new and modified code.

## Gate Criteria

### Mandatory Thresholds
| Criterion | Threshold | Status |
|-----------|-----------|--------|
| Line Coverage | ≥ 80% | ⬜ |
| Branch Coverage | ≥ 70% | ⬜ |
| Critical Path Coverage | 100% | ⬜ |
| All Tests Passing | 100% | ⬜ |

### Test Type Requirements
| Test Type | Requirement | Status |
|-----------|-------------|--------|
| Unit Tests | Required for services/utilities | ⬜ |
| Kernel Tests | Required for entities/plugins | ⬜ |
| Functional Tests | Required for user-facing features | ⬜ |

## Validation Commands

```bash
# Run all tests
phpunit web/modules/custom/

# Run with coverage
phpunit web/modules/custom/ \
  --coverage-html=coverage/ \
  --coverage-clover=coverage/clover.xml

# Run specific group
phpunit --group=my_module

# Check coverage percentage
php -r "
\$xml = simplexml_load_file('coverage/clover.xml');
\$metrics = \$xml->project->metrics;
\$coverage = (\$metrics['coveredstatements'] / \$metrics['statements']) * 100;
echo 'Coverage: ' . round(\$coverage, 2) . '%\n';
"
```

## Test Scenario Checklist

### Happy Path Tests
- [ ] Primary user workflow tested
- [ ] Expected inputs produce expected outputs
- [ ] Success messages displayed correctly

### Edge Case Tests
- [ ] Empty inputs handled
- [ ] Maximum values tested
- [ ] Boundary conditions verified

### Error Handling Tests
- [ ] Invalid inputs rejected
- [ ] Error messages appropriate
- [ ] No information leakage

### Permission Tests
- [ ] Anonymous access blocked
- [ ] Authorized access works
- [ ] Permission escalation prevented

## Coverage Report Analysis

### Files to Review
- New files should have > 80% coverage
- Modified files should maintain or improve coverage
- Critical business logic requires 100% coverage

### Uncovered Lines
Document any intentionally uncovered code:
| File | Lines | Reason |
|------|-------|--------|
| | | |

## Pass Criteria
- [ ] All tests passing (0 failures)
- [ ] Line coverage ≥ 80%
- [ ] Branch coverage ≥ 70%
- [ ] Critical paths 100% covered
- [ ] No skipped tests without documentation

## Score Calculation
```
Score = (line_coverage * 0.5) + (branch_coverage * 0.3) + (pass_rate * 0.2)
Pass = Score >= 80 AND pass_rate == 100
```
