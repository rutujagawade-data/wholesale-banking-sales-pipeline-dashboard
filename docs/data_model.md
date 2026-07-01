# Data Model

This project uses a simple star-style reporting model built from synthetic wholesale banking sales pipeline data.

## Model Overview

The raw source files provide the core business entities:

- `opportunities.csv` is the primary transaction table.
- `clients.csv` adds client attributes.
- `products.csv` adds product attributes.
- `relationship_managers.csv` adds ownership and team context.
- `targets.csv` provides quarterly target benchmarks.
- `weekly_pipeline_snapshots.csv` provides time-based pipeline history.

The processed table, `mart_pipeline_weekly.csv`, combines these inputs into a dashboard-ready analytics layer.

## Table Roles

### Fact-Like Tables

- `opportunities.csv`
  - Grain: one row per opportunity.
  - Purpose: stores the base sales opportunity details.

- `weekly_pipeline_snapshots.csv`
  - Grain: one row per opportunity per weekly snapshot.
  - Purpose: stores pipeline movement, stale indicators, and weekly KPI inputs.

- `mart_pipeline_weekly.csv`
  - Grain: one row per opportunity per weekly snapshot.
  - Purpose: serves as the final reporting mart for analysis and Tableau dashboards.

### Dimension-Like Tables

- `clients.csv`
  - Grain: one row per client.
  - Purpose: client profile and segmentation.

- `products.csv`
  - Grain: one row per product.
  - Purpose: product naming, grouping, and fee classification.

- `relationship_managers.csv`
  - Grain: one row per RM.
  - Purpose: ownership, team, and manager hierarchy.

- `targets.csv`
  - Grain: one row per quarter, region, and product group target.
  - Purpose: target benchmarking for performance tracking.

## Relationships

The relationships below are used to build the reporting mart:

- `opportunities.client_id` joins to `clients.client_id`
- `opportunities.product_id` joins to `products.product_id`
- `opportunities.rm_id` joins to `relationship_managers.rm_id`
- `weekly_pipeline_snapshots.opportunity_id` joins to `opportunities.opportunity_id`
- `targets.quarter`, `targets.region`, and `targets.product_group` align to the reporting grain in the mart

## Reporting Grain

The main reporting grain is:

- one row per `opportunity_id`
- one row per `snapshot_date`

This grain supports:

- weekly pipeline tracking
- stale opportunity monitoring
- RM follow-up prioritization
- quarter-end risk analysis
- target attainment reporting

## Why This Model Works

This model is effective for a portfolio dashboard because it:

- keeps raw source tables separate from reporting output
- makes the relationships easy to understand
- supports a consistent KPI layer
- allows Tableau to connect to a single curated mart
- makes the project easy to review without needing a live database

## Key Fields Used in Reporting

- `stage`
- `status`
- `probability`
- `weighted_fee`
- `days_since_last_activity`
- `is_stale`
- `is_past_due`
- `late_stage_flag`
- `priority_follow_up_flag`
- `target_fee`
- `target_pipeline`

## Notes

- The model is based on synthetic data created for portfolio use only.
- The processed mart can be used directly in Tableau or adapted into a SQL warehouse if needed later.

