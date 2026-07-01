# Wholesale Banking Sales Pipeline & Forecasting

An end-to-end business intelligence case study that converts synthetic wholesale
banking opportunity data into governed metrics, a weekly reporting mart, data-quality
checks, and an executive Tableau dashboard.

The solution is designed to support pipeline reviews, revenue forecasting, stale-deal
management, relationship-manager follow-up, and quarter-end risk decisions.

## Live Dashboard

[View the interactive dashboard on Tableau Public](https://public.tableau.com/views/WholesaleBankingExecutiveSalesPipelineSummary/Dashboard1)

![Wholesale Banking Executive Sales Pipeline Summary](dashboard/screenshots/01_executive_summary.png)

## Business Context

Wholesale banking leaders need a consistent weekly view of pipeline health and
forecast risk. The dashboard provides a shared reporting layer for sales leadership,
relationship managers, product leaders, finance partners, and analytics teams.

It supports four recurring decisions:

- whether the current fee forecast is sufficient to meet the quarterly target
- which regions, products, and pipeline stages drive the forecast
- which stale, past-due, or late-stage opportunities require intervention
- where relationship-manager follow-up should be prioritized

## Executive Findings

Figures below reflect the March 28, 2026 snapshot:

| Finding | Result | Interpretation |
|---|---:|---|
| Open pipeline | `$2.79B` | Total value of currently open opportunities |
| Probability-weighted pipeline | `$1.81B` | Risk-adjusted opportunity value |
| Open weighted fee | `$27.5M` | Probability-adjusted fee from open opportunities |
| Closed-won fee | `$1.0M` | Fee associated with opportunities already won |
| Forecast fee | `$28.5M` | Closed-won fee plus open weighted fee |
| Fee target | `$24.3M` | Quarterly target at the governed target grain |
| Forecast attainment | `117.2%` | Forecast is 17.2% above target, but remains dependent on open-deal conversion |
| Stale expected fee | `$21.6M` | Expected fee associated with inactive open opportunities |
| Past-due opportunities | `122` | Open deals beyond their expected close date |
| Late-stage opportunities | `332` | Open opportunities in Negotiation or Commitment |

The key leadership message is that forecast attainment is above target, but only
`$1.0M` is closed won. Most forecast value remains exposed to conversion, stale-deal,
and timing risk.

## Solution Architecture

```text
Synthetic source generation (Python)
                |
                v
Raw CSV source tables
                |
                v
SQL exploration and validation
                |
                v
Curated weekly pipeline mart
                |
                v
Governed Tableau calculations
                |
                v
Executive dashboard and decision support
```

The repository separates source data, transformation logic, metric logic, validation,
documentation, and dashboard assets so each layer can be reviewed independently.

## Data Model and Grain

| Dataset | Grain | Role |
|---|---|---|
| `clients.csv` | One row per client | Client, industry, region, and segment attributes |
| `opportunities.csv` | One row per opportunity | Opportunity ownership, value, dates, stage, and status |
| `weekly_pipeline_snapshots.csv` | One row per opportunity per available snapshot date | Historical pipeline state and probability |
| `relationship_managers.csv` | One row per relationship manager | RM team, region, and manager hierarchy |
| `products.csv` | One row per product | Product group and fee classification |
| `targets.csv` | One row per quarter, region, and product group | Fee and pipeline targets |
| `mart_pipeline_weekly.csv` | One row per opportunity per available snapshot date | Tableau-ready reporting mart |

Primary relationships are documented in
[`docs/data_model.md`](docs/data_model.md).

### Target-Grain Control

Targets exist at a different grain from opportunities. The Tableau model relates
`targets.csv` to the reporting mart by:

```text
quarter + region + product_group
```

Target values must be aggregated at that grain. Summing target columns across
opportunity-level mart rows would duplicate and inflate the target. Keeping targets
as a separate logical table prevents opportunity volume from changing target totals.

## Governed Metrics

| Metric | Definition |
|---|---|
| Open Pipeline | Sum of `opportunity_amount` for open opportunities |
| Weighted Pipeline | Sum of `opportunity_amount × probability` for open opportunities |
| Open Expected Fee | Sum of `expected_fee` for open opportunities |
| Open Weighted Fee | Sum of `expected_fee × probability` for open opportunities |
| Closed-Won Fee | Sum of `expected_fee` for closed-won opportunities |
| Forecast Fee | `Closed-Won Fee + Open Weighted Fee` |
| Forecast Attainment | `Forecast Fee / Target Fee` |
| Stale Opportunity | Open opportunity with more than 21 days since meaningful activity |
| Past-Due Opportunity | Open opportunity with an expected close date before the snapshot date |
| Late-Stage Opportunity | Open opportunity in Negotiation or Commitment |
| Priority Follow-Up | Open opportunity that is stale or past due |

Forecast Attainment is forward-looking. It estimates performance if probability-adjusted
open opportunities convert as expected; it does not represent realized revenue.

Detailed definitions and stage probabilities are maintained in
[`docs/kpi_dictionary.md`](docs/kpi_dictionary.md).

## Engineering Implementation

| Layer | Technology | Implementation |
|---|---|---|
| Data generation | Python, pandas, NumPy | Reproducible synthetic source tables with a fixed random seed |
| Source storage | CSV | Portable raw extracts and a processed reporting mart |
| Data transformation | Python and SQL | Joins, helper fields, dimensions, metric queries, and reporting models |
| Quality control | SQL and Python | Key uniqueness, null, stage, status, date, and reconciliation checks |
| Visualization | Tableau Public | Executive KPIs, trends, segmentation, filters, and risk indicators |
| Version control | Git and GitHub | Change history, pull-request workflow, and project documentation |

## SQL Framework

The SQL is written in portable ANSI-style syntax and organized by analytical purpose:

| Folder | Purpose |
|---|---|
| [`sql/01_exploration`](sql/01_exploration) | Row counts, null profiling, distinct values, and date coverage |
| [`sql/02_modeling`](sql/02_modeling) | Enriched opportunity base view and reusable dimensions |
| [`sql/03_metrics`](sql/03_metrics) | Pipeline health, forecast, stale deals, RM follow-up, risk, and attainment |
| [`sql/04_validation`](sql/04_validation) | Duplicate checks, stage logic, forecast reconciliation, and final QC |

The SQL files document their source, output grain, and purpose. In a production
warehouse, these queries would be materialized as governed views or scheduled models.

## Data-Quality Controls

| Control | Validated result |
|---|---:|
| Reporting-mart rows | `7,353` |
| Weekly snapshots | `13` |
| Snapshot range | `2026-01-03` to `2026-03-28` |
| Opportunities in latest snapshot | `570` |
| Duplicate snapshot IDs | `0` |
| Duplicate opportunities in latest snapshot | `0` |
| Missing snapshot or opportunity keys | `0` |
| Invalid stage values | `0` |
| Invalid status values | `0` |

Validation queries are retained in
[`sql/04_validation`](sql/04_validation) so the reporting layer can be checked
before dashboard refreshes.

## Reproduce the Dataset

The synthetic dataset can be regenerated with
[`generate_sales_pipeline_data.ipynb`](generate_sales_pipeline_data.ipynb).

Requirements:

```text
Python 3
pandas
numpy
```

Run the notebook from the repository root. It:

- creates the six raw CSV source tables
- builds `data/processed/mart_pipeline_weekly.csv`
- performs row-count and KPI validation
- creates a portable ZIP archive of the generated data

The random seed is fixed at `42` for reproducibility.

> Running all notebook cells overwrites CSV files with the same names in
> `data/raw/` and `data/processed/`.

## Project Structure

```text
.
├── dashboard/
│   ├── dashboard_overview.md
│   ├── measure_notes.md
│   └── screenshots/
├── data/
│   ├── raw/
│   └── processed/
├── docs/
├── sql/
│   ├── 01_exploration/
│   ├── 02_modeling/
│   ├── 03_metrics/
│   └── 04_validation/
├── generate_sales_pipeline_data.ipynb
└── README.md
```

## Production Considerations

This project uses CSV files for portability. A production implementation would require:

- automated incremental data ingestion
- a governed cloud data warehouse
- scheduled data-quality and freshness monitoring
- role-based access to sensitive banking data
- certified datasets for self-service reporting

## Limitations and Tradeoffs

- All data is synthetic and represents a portfolio scenario.
- The dataset covers one quarter, so it supports weekly movement but not year-over-year analysis.
- CSV storage prioritizes portability and transparency over scale and concurrency.
- The pipeline is rebuilt in batch rather than loaded incrementally.
- Opportunity probabilities are deterministic stage rules, not predictive-model outputs.
- No production scheduler, cloud warehouse, alerting, or access-control layer is implemented.
- Forecast Attainment is an outlook and should not be interpreted as realized revenue.

## Project Documentation

- [Business Problem](docs/business_problem.md)
- [KPI Dictionary](docs/kpi_dictionary.md)
- [Data Dictionary](docs/data_dictionary.md)
- [Data Model](docs/data_model.md)
- [Insights Summary](docs/insights_summary.md)
- [Dashboard Overview](dashboard/dashboard_overview.md)
- [Tableau Measure Notes](dashboard/measure_notes.md)

## Data Disclaimer

All data is synthetic and was created solely for this project. No real client,
employer, transaction, or confidential banking information is included.
