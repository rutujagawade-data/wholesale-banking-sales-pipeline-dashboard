-- Purpose: Confirm date coverage and spot gaps in the data.
-- Grain: One row per date field or date bucket.
-- Notes: Check created date, updated date, close date, and snapshot date if available.

select
    'opportunities.created_date' as field_name,
    min(created_date) as min_date,
    max(created_date) as max_date
from opportunities

union all

select
    'opportunities.expected_close_date' as field_name,
    min(expected_close_date) as min_date,
    max(expected_close_date) as max_date
from opportunities

union all

select
    'opportunities.actual_close_date' as field_name,
    min(actual_close_date) as min_date,
    max(actual_close_date) as max_date
from opportunities

union all

select
    'weekly_pipeline_snapshots.snapshot_date' as field_name,
    min(snapshot_date) as min_date,
    max(snapshot_date) as max_date
from weekly_pipeline_snapshots;
