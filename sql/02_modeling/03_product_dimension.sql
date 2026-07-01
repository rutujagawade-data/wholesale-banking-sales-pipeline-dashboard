-- Purpose: Standardize product hierarchy and product groupings.
-- Grain: One row per product or product group.
-- Notes: Useful for rolling up product lines in the dashboard.

select
    product_id,
    product_name,
    product_group,
    fee_type
from products;
