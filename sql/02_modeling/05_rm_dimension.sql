-- Purpose: Standardize relationship manager ownership fields.
-- Grain: One row per relationship manager.
-- Notes: Include RM name, team, region, and active/inactive status if available.

select
    rm_id,
    relationship_manager,
    team,
    region,
    manager_name
from relationship_managers;
