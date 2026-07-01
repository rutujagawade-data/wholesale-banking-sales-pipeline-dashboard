-- Purpose: Count rows in each source table to understand data volume.
-- Grain: One row per source table.
-- Notes: Replace table names with your actual raw/source tables.

select 'clients' as table_name, count(*) as row_count from clients
union all
select 'opportunities' as table_name, count(*) as row_count from opportunities
union all
select 'weekly_pipeline_snapshots' as table_name, count(*) as row_count from weekly_pipeline_snapshots
union all
select 'relationship_managers' as table_name, count(*) as row_count from relationship_managers
union all
select 'products' as table_name, count(*) as row_count from products
union all
select 'targets' as table_name, count(*) as row_count from targets
union all
select 'mart_pipeline_weekly' as table_name, count(*) as row_count from mart_pipeline_weekly;
