-- Purpose: Build the enriched opportunity-level base table for reporting.
-- Grain: One row per opportunity.
-- Source: opportunities, clients, products, relationship_managers.
-- Notes: This is the core dataset for downstream metrics and dashboarding.

with base_opportunities as (
    select
        opportunity_id,
        client_id,
        product_id,
        rm_id,
        created_date,
        expected_close_date,
        opportunity_amount,
        source_channel,
        expected_fee,
        stage,
        status,
        actual_close_date
    from opportunities
)

select
    o.opportunity_id,
    o.client_id,
    o.product_id,
    o.rm_id,
    o.created_date,
    o.expected_close_date,
    o.opportunity_amount,
    o.source_channel,
    o.expected_fee,
    o.stage,
    o.status,
    o.actual_close_date,
    c.client_name,
    c.industry,
    c.region,
    c.client_segment,
    c.relationship_start_date,
    p.product_name,
    p.product_group,
    p.fee_type,
    rm.relationship_manager,
    rm.team,
    rm.manager_name
from base_opportunities o
left join clients c
    on o.client_id = c.client_id
left join products p
    on o.product_id = p.product_id
left join relationship_managers rm
    on o.rm_id = rm.rm_id;
