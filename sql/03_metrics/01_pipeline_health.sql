-- Purpose: Summarize core pipeline health KPIs.
-- Grain: One row per reporting slice such as quarter, region, product group, industry, RM, or stage.
-- Source: mart_pipeline_weekly.
-- Notes: Includes total pipeline, weighted pipeline, stage mix, and win rate.

with pipeline as (
    select
        quarter,
        region,
        product_group,
        industry,
        relationship_manager,
        stage,
        opportunity_amount,
        probability,
        case
            when lower(status) = 'closed won' then 1
            else 0
        end as won_flag
    from mart_pipeline_weekly
)

select
    quarter,
    region,
    product_group,
    industry,
    relationship_manager,
    stage,
    count(*) as opportunity_count,
    sum(opportunity_amount) as total_pipeline_amount,
    sum(opportunity_amount * probability) as weighted_pipeline_amount,
    avg(won_flag) as win_rate
from pipeline
group by
    quarter,
    region,
    product_group,
    industry,
    relationship_manager,
    stage;
