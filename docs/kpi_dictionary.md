# KPI Dictionary

This document defines the core KPIs used in the Wholesale Banking Sales Pipeline & Forecasting Dashboard.

> Note: This project uses synthetic data created for portfolio purposes. No real client, employer, or confidential banking data is used.

---

## Executive KPIs

| KPI | Definition | Formula | Business Purpose |
|---|---|---|---|
| Open Pipeline | Total value of active opportunities that are not closed won or closed lost. | `SUM(Opportunity Amount) WHERE Status NOT IN ('Closed Won', 'Closed Lost')` | Shows the total active sales pipeline available for future conversion. |
| Weighted Fee | Probability-adjusted expected fee from open opportunities. | `SUM(Expected Fee × Probability) WHERE Status NOT IN ('Closed Won', 'Closed Lost')` | Helps estimate forecasted fee revenue based on deal probability. |
| Closed Won Fee | Total expected fee from opportunities that have been successfully won. | `SUM(Expected Fee) WHERE Status = 'Closed Won'` | Shows realized or booked fee opportunity from won deals. |
| Target Attainment % | Closed won fee compared to quarterly target fee. | `Closed Won Fee / Target Fee` | Measures progress toward quarterly revenue goals. |
| Pipeline Coverage | Weighted pipeline compared to the remaining quarterly target. | `Weighted Fee / (Target Fee - Closed Won Fee)` | Shows whether current weighted pipeline is enough to cover the remaining target gap. |
| Stale Pipeline % | Share of open expected fee tied to stale opportunities. | `Stale Expected Fee / Total Open Expected Fee` | Identifies pipeline quality risk and follow-up needs. |
| WoW Open Pipeline Change | Change in open pipeline compared to the prior weekly snapshot. | `Current Week Open Pipeline - Prior Week Open Pipeline` | Shows whether total active pipeline is growing or shrinking week over week. |
| WoW Weighted Fee Change | Change in weighted fee compared to the prior weekly snapshot. | `Current Week Weighted Fee - Prior Week Weighted Fee` | Shows whether forecasted fee revenue improved or declined week over week. |
| WoW Stale Pipeline Change | Change in stale expected fee compared to the prior weekly snapshot. | `Current Week Stale Expected Fee - Prior Week Stale Expected Fee` | Highlights whether pipeline quality is improving or deteriorating. |

---

## Pipeline Stage Definitions

| Stage | Status Group | Meaning | Typical Probability |
|---|---|---|---:|
| Prospecting | Open | Early opportunity identified, but client need is not fully validated. | 10% |
| Qualification | Open | Client need, timing, and product fit are being validated. | 25% |
| Proposal | Open | Solution, pricing, or proposal has been shared or is being prepared. | 50% |
| Negotiation | Open | Terms, pricing, structure, or approvals are being discussed. | 70% |
| Commitment | Open | Verbal or near-final commitment; pending documentation or final approval. | 90% |
| Closed Won | Closed | Opportunity has been successfully won or booked. | 100% |
| Closed Lost | Closed | Opportunity was lost, cancelled, or is no longer moving forward. | 0% |

---

## Business Rules

- Valid pipeline stages are `Prospecting`, `Qualification`, `Proposal`, `Negotiation`, `Commitment`, `Closed Won`, and `Closed Lost`.
- Open stages include `Prospecting`, `Qualification`, `Proposal`, `Negotiation`, and `Commitment`.
- Closed stages include `Closed Won` and `Closed Lost`.
- An opportunity is considered open if status is not `Closed Won` or `Closed Lost`.
- Weighted Fee is calculated as `Expected Fee × Probability`.
- An opportunity is considered stale if it is open and has had no activity for more than 21 days.
- An opportunity is considered past due if its expected close date is before the current snapshot date and the opportunity is still open.
- Late-stage pipeline includes opportunities in `Negotiation` or `Commitment`.
- Target Attainment % is calculated at the quarter, region, and product-group level.
- Opportunity-level detail should reconcile back to executive KPI totals.
