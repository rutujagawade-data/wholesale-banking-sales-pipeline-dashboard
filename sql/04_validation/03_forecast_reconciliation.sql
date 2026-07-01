-- Purpose: Reconcile forecast totals against source or dashboard totals.
-- Grain: One row per period or reconciliation slice.
-- Notes: Use this to confirm metric consistency before publishing.

select
    quarter,
    region,
    sum(open_expected_fee) as mart_open_expected_fee,
    sum(weighted_fee) as mart_weighted_fee,
    sum(target_fee) as mart_target_fee
from mart_pipeline_weekly
group by
    quarter,
    region;
