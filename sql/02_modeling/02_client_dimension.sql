-- Purpose: Standardize client attributes for reporting.
-- Grain: One row per client.
-- Notes: Include client segment, region, relationship ownership, and any parent-child mappings.

select
    client_id,
    client_name,
    industry,
    region,
    client_segment,
    relationship_start_date
from clients;
