# E1: PLAN Gate Evaluation

## Purpose
Evaluates the quality of planning artifacts before proceeding to SETUP phase.

## Scoring Criteria

### Epic Decomposition (Weight: 2.0x)
| Criteria | Points |
|----------|--------|
| Epic broken into vertical slices | 20 |
| Each slice delivers end-to-end value | 15 |
| Stories follow INVEST principles | 15 |
| **Subtotal** | 50 |

### Acceptance Criteria (Weight: 2.0x)
| Criteria | Points |
|----------|--------|
| All stories have AC | 15 |
| AC follows Given-When-Then format | 10 |
| AC are testable and measurable | 15 |
| Edge cases identified | 10 |
| **Subtotal** | 50 |

### Technical Analysis (Weight: 1.5x)
| Criteria | Points |
|----------|--------|
| Technical feasibility confirmed | 15 |
| Architecture approach defined | 15 |
| Risks identified and mitigated | 10 |
| Complexity estimated | 10 |
| **Subtotal** | 50 |

### Documentation (Weight: 1.0x)
| Criteria | Points |
|----------|--------|
| Dependency map created | 10 |
| Risk assessment documented | 10 |
| RCA complete (if applicable) | 10 |
| **Subtotal** | 30 |

## Scoring Formula

```
Raw Score = Σ(Criteria Points × Weight)
Normalized Score = (Raw Score / Max Possible) × 100
```

## Thresholds

| Score | Result | Action |
|-------|--------|--------|
| ≥80% | **PASS** | Proceed to SETUP |
| 70-79% | **PARTIAL** | Address specific gaps |
| <70% | **FAIL** | Return to PLAN with feedback |

## Token Optimization

- **PASS**: Proceed immediately (no additional tokens)
- **PARTIAL**: Targeted fix prompt (minimal tokens)
- **FAIL**: Full re-analysis required

## Evaluation Checklist

```markdown
## E1 Gate Checklist

### Epic Decomposition
- [ ] Stories represent vertical slices
- [ ] No technical-only stories
- [ ] Story independence verified

### Acceptance Criteria
- [ ] All stories have ≥3 AC
- [ ] AC are executable tests
- [ ] Happy path + edge cases

### Technical Analysis
- [ ] Drupal patterns identified
- [ ] Dependencies mapped
- [ ] Complexity estimated

### Ready for SETUP?
Score: ___/100  |  Result: PASS / PARTIAL / FAIL
```
