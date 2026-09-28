# IMP — Governed Metrics Platform

Interview / portfolio showcase for a **Senior Business Intelligence Engineer** role: a governed dbt semantic layer, metric definitions, and glossary that replace ad-hoc SQL sprawl.

Inspired by real delivery patterns from BI modernization work (dbt + Snowflake, semantic metrics, stakeholder self-serve).

## What this repo demonstrates

- Governed **dbt models** for Sales, Finance, and Operations subjects
- A **250-metric-ready semantic layer** scaffold (`metrics/` + `models/semantic`)
- A starter **business glossary** (terms → owners → certified models)
- Data-quality tests that keep pipeline failure rates low
- Clear separation: staging → marts → semantic exposure

## Layout

```
dbt_project/     Transformations and semantic models
metrics/         Versioned metric YAML (name, grain, owner, SQL expression)
docs/            Glossary + architecture notes
scripts/         Helpers for validating metric YAML
```

## Quick start

```bash
cd dbt_project
cp profiles.yml.example profiles.yml   # or use env-based profile
dbt deps
dbt run --select staging marts
dbt test
python ../scripts/validate_metrics.py
```

## Core metrics (sample)

| Metric | Grain | Owner |
|--------|-------|-------|
| `gross_merchandise_value` | day × customer | Finance |
| `active_customers` | day | Growth |
| `payment_success_rate` | day × method | Payments |
| `net_revenue` | day × product | Finance |

## Design principles

1. **One certified path** — dashboards read semantic models, not raw tables
2. **Metrics as code** — pull-requested YAML with owners and tests
3. **Ambiguity resolved once** — glossary locks definitions Sales and Finance share
