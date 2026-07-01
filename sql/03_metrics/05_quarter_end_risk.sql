-- Purpose: Identify late-stage deals at risk before quarter-end.
-- Grain: One row per opportunity.
-- Source: mart_pipeline_weekly.
-- Notes: Includes close date risk, stage risk, and forecast slippage indicators.

select
    snapshot_date,
    opportunity_id,
    client_name,
    relationship_manager,
    stage,
    expected_close_date,
    opportunity_amount,
    probability,
    late_stage_flag,
    is_past_due,
    priority_follow_up_flag
from mart_pipeline_weekly
where late_stage_flag = true
   or is_past_due = true;
