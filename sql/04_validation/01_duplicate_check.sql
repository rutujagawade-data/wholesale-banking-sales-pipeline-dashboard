-- Purpose: Check for duplicate business keys or opportunity records.
-- Grain: One row per duplicate group.
-- Notes: Validate unique opportunity ids and any composite business keys.

select
    opportunity_id,
    count(*) as record_count
from mart_pipeline_weekly
group by opportunity_id
having count(*) > 1;

-- If this returns rows, the mart is not one row per opportunity snapshot and needs deduping.
