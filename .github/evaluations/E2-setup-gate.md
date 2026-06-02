# E2: SETUP Gate Evaluation

## Purpose
Verifies repository and development environment configuration before CODE phase.

## Scoring Criteria

### Branch Management (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| Feature branch created | 25 |
| Branch naming convention followed | 15 |
| Branch from correct base (main/develop) | 10 |
| **Subtotal** | 50 |

### CI/CD Configuration (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| CI pipeline configured | 25 |
| PHPCS check enabled | 10 |
| PHPStan check enabled | 10 |
| PHPUnit check enabled | 5 |
| **Subtotal** | 50 |

### Development Environment (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| Local environment verified | 15 |
| Composer dependencies installed | 15 |
| Database accessible | 10 |
| **Subtotal** | 40 |

### Module Scaffolding (Weight: 1.0x - If Applicable)
| Criteria | Points |
|----------|--------|
| .info.yml created | 10 |
| Directory structure created | 10 |
| services.yml configured | 5 |
| **Subtotal** | 25 |

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| 100% | **PASS** | Proceed to CODE |
| 80-99% | **PARTIAL** | Fix critical items |
| <80% | **FAIL** | Complete SETUP |

**Note**: E2 requires 100% on critical items (branch + CI).

## Evaluation Checklist

```markdown
## E2 Gate Checklist

### Branch (Required)
- [ ] Branch created: feature/PROJ-XXX-description
- [ ] Based on correct parent branch
- [ ] No merge conflicts

### CI/CD (Required)
- [ ] Pipeline file exists
- [ ] PHPCS passing
- [ ] PHPStan passing

### Environment
- [ ] Can run `drush status`
- [ ] Can access database
- [ ] Composer install successful

### Scaffolding (if new module)
- [ ] Module directory created
- [ ] .info.yml valid
- [ ] Module can be enabled

### Ready for CODE?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```
