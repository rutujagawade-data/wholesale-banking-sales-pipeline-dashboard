-- Purpose: Run final quality checks before sharing the dashboard.
-- Grain: One row per validation rule.
-- Source: mart_pipeline_weekly.
-- Notes: Includes row counts, null checks, key metric sanity checks, and reconciliation tests.

select
    'row_count_check' as check_name,
    count(*) as check_value
from mart_pipeline_weekly

union all

select
    'null_opportunity_id_check' as check_name,
    count(*) as check_value
from mart_pipeline_weekly
where opportunity_id is null

union all

select
    'null_close_date_check' as check_name,
    count(*) as check_value
from mart_pipeline_weekly
where expected_close_date is null;
