-- Purpose: Compare pipeline and forecast against targets.
-- Grain: One row per quarter, region, and product group.
-- Source: mart_pipeline_weekly.
-- Notes: Use for leadership views and target progress tracking.

select
    quarter,
    region,
    product_group,
    sum(target_fee) as target_fee,
    sum(target_pipeline) as target_pipeline,
    sum(open_pipeline) as actual_open_pipeline,
    sum(open_expected_fee) as actual_open_expected_fee,
    sum(closed_won_fee) as actual_closed_won_fee
from mart_pipeline_weekly
group by
    quarter,
    region,
    product_group;
