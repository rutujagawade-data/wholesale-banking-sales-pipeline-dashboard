-- Purpose: Check null rates in key business fields.
-- Grain: One row per source column or field.
-- Notes: Focus on opportunity id, stage, amount, close date, RM, client, and product.

select
    'opportunities.opportunity_id' as field_name,
    sum(case when opportunity_id is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'opportunities.client_id' as field_name,
    sum(case when client_id is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'opportunities.product_id' as field_name,
    sum(case when product_id is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'opportunities.rm_id' as field_name,
    sum(case when rm_id is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'opportunities.expected_close_date' as field_name,
    sum(case when expected_close_date is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'opportunities.opportunity_amount' as field_name,
    sum(case when opportunity_amount is null then 1 else 0 end) as null_count
from opportunities

union all

select
    'mart_pipeline_weekly.probability' as field_name,
    sum(case when probability is null then 1 else 0 end) as null_count
from mart_pipeline_weekly

union all

select
    'mart_pipeline_weekly.days_since_last_activity' as field_name,
    sum(case when days_since_last_activity is null then 1 else 0 end) as null_count
from mart_pipeline_weekly;
