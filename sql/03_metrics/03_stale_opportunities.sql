-- Purpose: Identify stale opportunities and follow-up candidates.
-- Grain: One row per opportunity.
-- Source: mart_pipeline_weekly.
-- Notes: Useful for stale deal tracking and RM prioritization.

with stale_base as (
    select
        opportunity_id,
        client_id,
        client_name,
        relationship_manager,
        stage,
        opportunity_amount,
        days_since_last_activity,
        is_stale,
        is_past_due,
        expected_close_date,
        priority_follow_up_flag
    from mart_pipeline_weekly
)

select
    *
from stale_base
where is_stale = true
   or priority_follow_up_flag = true;
