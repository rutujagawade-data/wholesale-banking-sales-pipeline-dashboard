-- Purpose: Standardize industry classifications.
-- Grain: One row per industry.
-- Notes: Include raw industry, mapped industry, and any parent industry hierarchy.

select distinct
    industry
from clients;
