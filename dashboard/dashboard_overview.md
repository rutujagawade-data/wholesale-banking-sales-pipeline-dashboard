# Dashboard Overview

This folder contains the Tableau dashboard assets for the Wholesale Banking Sales Pipeline & Forecasting project.

## Live Dashboard

[View the interactive dashboard on Tableau Public](https://public.tableau.com/views/WholesaleBankingExecutiveSalesPipelineSummary/Dashboard1)

## Purpose

The dashboard is designed as an executive command center for:

- pipeline health monitoring
- forecast tracking
- stale opportunity review
- relationship-manager follow-up
- quarter-end risk review

## Business Audience

- Head of Wholesale Banking
- Sales leadership
- Relationship managers
- Product leaders
- Finance and BI teams

## Dashboard Views

- Executive KPI cards for pipeline, forecast, fees, and attainment
- Pipeline by stage
- Forecast fee versus target fee
- Weekly forecast trend
- Regional pipeline
- Product mix
- Leadership attention indicators

## Interactive Filters

- Snapshot date
- Region
- Product group
- RM team

## Folder Content

- `screenshots/01_executive_summary.png` - final exported dashboard image
- `measure_notes.md` - key dashboard calculations and KPI notes

## Dashboard Storyline

The dashboard should answer:

1. How healthy is the current pipeline?
2. Which regions and product groups are most active?
3. Which opportunities are stale or past due?
4. Which relationship managers need to follow up?
5. How does pipeline compare with targets?

## Notes

- The dashboard uses the synthetic CSV data stored in `data/`.
- The processed mart, `data/processed/mart_pipeline_weekly.csv`, is the preferred reporting source.
- The final dashboard image was exported at `1799 x 1199` pixels.
