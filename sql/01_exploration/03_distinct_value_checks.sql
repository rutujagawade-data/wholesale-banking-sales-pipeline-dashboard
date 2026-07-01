-- Purpose: Review distinct values for categorical fields.
-- Grain: One row per distinct field value.
-- Notes: Useful for stage, forecast category, product, industry, and RM mapping checks.

select distinct stage from opportunities
union
select distinct stage from weekly_pipeline_snapshots
union
select distinct status from opportunities
union
select distinct product_group from products
union
select distinct industry from clients
union
select distinct relationship_manager from relationship_managers;
