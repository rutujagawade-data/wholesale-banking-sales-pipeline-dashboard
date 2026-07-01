-- Purpose: Compare forecasted fee with realized closed-won fee.
-- Grain: One row per quarter, region, and product group.
-- Source: mart_pipeline_weekly.
-- Notes: This uses the processed mart so forecast and actual values stay aligned.

select
    quarter,
    region,
    product_group,
    sum(open_expected_fee) as forecast_expected_fee,
    sum(closed_won_fee) as actual_closed_won_fee,
    sum(open_expected_fee) - sum(closed_won_fee) as forecast_variance
from mart_pipeline_weekly
group by
    quarter,
    region,
    product_group;
