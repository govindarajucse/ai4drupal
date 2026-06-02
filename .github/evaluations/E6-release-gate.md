# E6: RELEASE Gate Evaluation

## Purpose
Final quality gate before merging PR and deploying. Verifies all prerequisites are met.

## Scoring Criteria

### Gate Prerequisites (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| E1 (PLAN) passed | 10 |
| E2 (SETUP) passed | 10 |
| E3 (CODE) passed | 10 |
| E4 (BUILD) passed | 10 |
| E5 (TEST) passed | 10 |
| **Subtotal** | 50 |

### Pull Request (Weight: 2.0x - Critical)
| Criteria | Points |
|----------|--------|
| PR created with description | 15 |
| All CI checks passing | 20 |
| Required approvals received | 15 |
| No merge conflicts | 10 |
| **Subtotal** | 60 |

### Documentation (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| README updated (if needed) | 10 |
| CHANGELOG updated | 10 |
| Release notes prepared | 10 |
| **Subtotal** | 30 |

### Deployment Readiness (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| Deployment checklist complete | 15 |
| Rollback procedure documented | 10 |
| Config changes identified | 10 |
| Database updates identified | 10 |
| **Subtotal** | 45 |

### Jira Status (Weight: 1.0x)
| Criteria | Points |
|----------|--------|
| Ticket status updated | 10 |
| Work logged | 5 |
| Linked to PR | 5 |
| **Subtotal** | 20 |

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| 100% | **PASS** | Merge and deploy |
| 90-99% | **PARTIAL** | Complete missing items |
| <90% | **FAIL** | Return to previous phase |

**Note**: E6 requires all previous gates to have passed.

## Pre-Merge Checklist

```bash
# Verify all CI checks
gh pr checks

# Verify approvals
gh pr view --json reviews

# Update Jira
# Use Jira MCP or manual update

# Final verification
drush updatedb --no-post-updates
drush cr
drush config:import -y
```

## Deployment Preparation

### Configuration Sync
```bash
# Export config
drush cex -y

# Verify config changes
git diff config/sync/

# Import on target
drush cim -y
```

### Database Updates
```bash
# Check for pending updates
drush updatedb:status

# Apply updates
drush updatedb -y
```

## Evaluation Checklist

```markdown
## E6 Gate Checklist

### Previous Gates
- [ ] E1 (PLAN): PASSED
- [ ] E2 (SETUP): PASSED
- [ ] E3 (CODE): PASSED
- [ ] E4 (BUILD): PASSED
- [ ] E5 (TEST): PASSED

### Pull Request
- [ ] PR description complete
- [ ] All CI checks green
- [ ] Required approvals: ___/___
- [ ] No conflicts

### Documentation
- [ ] Release notes written
- [ ] CHANGELOG updated
- [ ] README updated (if needed)

### Deployment
- [ ] Deployment checklist ready
- [ ] Rollback procedure tested
- [ ] Stakeholders notified

### Jira
- [ ] Status: Ready for Deployment
- [ ] Time logged
- [ ] PR linked

### Ready for MERGE?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```

## Post-Release

After successful release:
1. Update Jira to "Done"
2. Tag release in git
3. Send release notification
4. Monitor for issues
