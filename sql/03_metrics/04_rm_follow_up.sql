-- Purpose: Flag opportunities that require relationship-manager follow-up.
-- Grain: One row per opportunity.
-- Source: mart_pipeline_weekly.
-- Notes: Filter based on inactivity, stage aging, and follow-up risk.

select
    opportunity_id,
    client_name,
    relationship_manager,
    team,
    stage,
    opportunity_amount,
    days_since_last_activity,
    is_stale,
    is_past_due,
    late_stage_flag,
    priority_follow_up_flag
from mart_pipeline_weekly
where priority_follow_up_flag = true;
