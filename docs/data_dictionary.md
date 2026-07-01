# Data Dictionary

This document defines the fields used in the synthetic wholesale banking sales pipeline dataset.

## Raw Tables

### `clients.csv`

| Field | Type | Description |
|---|---|---|
| `client_id` | Text | Unique identifier for the client. |
| `client_name` | Text | Client display name. |
| `industry` | Text | Client industry classification. |
| `region` | Text | Client region. |
| `client_segment` | Text | Client segment such as middle market or corporate. |
| `relationship_start_date` | Date | Date the relationship with the client started. |

### `opportunities.csv`

| Field | Type | Description |
|---|---|---|
| `opportunity_id` | Text | Unique identifier for the opportunity. |
| `client_id` | Text | Client linked to the opportunity. |
| `product_id` | Text | Product linked to the opportunity. |
| `rm_id` | Text | Relationship manager owner. |
| `created_date` | Date | Date the opportunity was created. |
| `expected_close_date` | Date | Forecasted close date. |
| `opportunity_amount` | Numeric | Opportunity value. |
| `source_channel` | Text | Lead source or origination channel. |
| `expected_fee` | Numeric | Estimated fee value. |
| `stage` | Text | Current sales stage. |
| `status` | Text | Opportunity status such as open, won, or lost. |
| `actual_close_date` | Date | Actual close date if the opportunity is closed. |

### `weekly_pipeline_snapshots.csv`

| Field | Type | Description |
|---|---|---|
| `snapshot_id` | Text | Unique identifier for the weekly snapshot row. |
| `snapshot_date` | Date | Snapshot date for the weekly pipeline extract. |
| `opportunity_id` | Text | Opportunity captured in the snapshot. |
| `stage` | Text | Pipeline stage at snapshot date. |
| `status` | Text | Opportunity status at snapshot date. |
| `opportunity_amount` | Numeric | Opportunity amount at snapshot date. |
| `expected_fee` | Numeric | Expected fee at snapshot date. |
| `probability` | Numeric | Close probability used for weighted metrics. |
| `weighted_fee` | Numeric | Expected fee multiplied by probability. |
| `days_since_last_activity` | Integer | Days since last meaningful activity. |
| `is_stale` | Boolean | Indicates whether the opportunity is stale. |
| `is_past_due` | Boolean | Indicates whether the expected close date has passed. |
| `expected_close_date` | Date | Forecasted close date at snapshot time. |

### `relationship_managers.csv`

| Field | Type | Description |
|---|---|---|
| `rm_id` | Text | Unique identifier for the relationship manager. |
| `relationship_manager` | Text | Relationship manager name. |
| `team` | Text | Team or coverage group. |
| `region` | Text | Region covered by the RM. |
| `manager_name` | Text | Direct manager or supervisor name. |

### `products.csv`

| Field | Type | Description |
|---|---|---|
| `product_id` | Text | Unique product identifier. |
| `product_name` | Text | Product name. |
| `product_group` | Text | Higher-level product grouping. |
| `fee_type` | Text | Fee classification associated with the product. |

### `targets.csv`

| Field | Type | Description |
|---|---|---|
| `target_id` | Text | Unique target record identifier. |
| `quarter` | Text | Quarter covered by the target. |
| `region` | Text | Region covered by the target. |
| `product_group` | Text | Product group covered by the target. |
| `target_fee` | Numeric | Target fee value. |
| `target_pipeline` | Numeric | Target pipeline value. |

## Processed Mart

### `mart_pipeline_weekly.csv`

This file combines the raw data into a single reporting table used for analysis and Tableau dashboards.

| Field | Type | Description |
|---|---|---|
| `snapshot_id` | Text | Weekly snapshot identifier. |
| `snapshot_date` | Date | Snapshot date. |
| `opportunity_id` | Text | Opportunity identifier. |
| `stage` | Text | Opportunity stage. |
| `status` | Text | Opportunity status. |
| `opportunity_amount` | Numeric | Opportunity amount. |
| `expected_fee` | Numeric | Expected fee. |
| `probability` | Numeric | Probability of closing. |
| `weighted_fee` | Numeric | Probability-weighted fee. |
| `days_since_last_activity` | Integer | Inactivity measure used for stale tracking. |
| `is_stale` | Boolean | Stale deal indicator. |
| `is_past_due` | Boolean | Past-due indicator. |
| `expected_close_date` | Date | Expected close date. |
| `client_id` | Text | Client identifier. |
| `product_id` | Text | Product identifier. |
| `rm_id` | Text | Relationship manager identifier. |
| `created_date` | Date | Opportunity creation date. |
| `source_channel` | Text | Lead or origination channel. |
| `client_name` | Text | Client name. |
| `industry` | Text | Client industry. |
| `region` | Text | Region. |
| `client_segment` | Text | Client segment. |
| `relationship_start_date` | Date | Date the client relationship began. |
| `product_name` | Text | Product name. |
| `product_group` | Text | Product group. |
| `fee_type` | Text | Fee classification. |
| `relationship_manager` | Text | RM name. |
| `team` | Text | RM team. |
| `manager_name` | Text | RM manager name. |
| `snapshot_week` | Date | Week start date for the snapshot. |
| `year` | Integer | Calendar year. |
| `quarter` | Text | Calendar quarter. |
| `month` | Integer | Calendar month. |
| `week_number` | Integer | Week number within the year. |
| `open_pipeline` | Integer | Open pipeline count or flag. |
| `open_expected_fee` | Numeric | Open expected fee amount. |
| `stale_expected_fee` | Numeric | Expected fee for stale opportunities. |
| `closed_won_fee` | Numeric | Fee from closed won opportunities. |
| `deal_age_days` | Integer | Age of the deal in days. |
| `late_stage_flag` | Boolean | Indicates whether the deal is in a late stage. |
| `priority_follow_up_flag` | Boolean | Indicates whether RM follow-up is needed. |
| `target_fee` | Numeric | Target fee for the grouping. |
| `target_pipeline` | Numeric | Target pipeline for the grouping. |

## KPI Definitions

| KPI | Definition |
|---|---|
| Pipeline | Total open opportunity amount in the reporting period. |
| Weighted Pipeline | Opportunity amount multiplied by probability. |
| Expected Fee | Estimated fee associated with an opportunity. |
| Weighted Fee | Expected fee multiplied by probability. |
| Closed Won Fee | Fee value from opportunities that were won. |
| Stale Opportunity | An opportunity with no recent activity beyond the defined threshold. |
| Past Due Deal | An opportunity whose expected close date has passed. |
| Late-Stage Deal | An open opportunity in a later sales stage that may be at risk. |
| Priority Follow-Up Flag | Binary indicator showing an opportunity needs RM attention. |
| Target Fee | Leadership target for fee generation. |
| Target Pipeline | Leadership target for pipeline value. |

