-- Purpose: Validate stage values and stage transition logic.
-- Grain: One row per issue or invalid record.
-- Notes: Catch impossible or unexpected stage sequences.

select
    opportunity_id,
    snapshot_date,
    stage,
    status
from mart_pipeline_weekly
where stage is null
   or status is null
   or (lower(status) = 'closed won' and lower(stage) not in ('closed won', 'won'))
   or (lower(status) = 'closed lost' and lower(stage) not in ('closed lost', 'lost'));
