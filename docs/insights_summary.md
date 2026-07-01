# Insights Summary

This summary highlights the main patterns visible in the synthetic wholesale banking sales pipeline mart (`mart_pipeline_weekly.csv`) and the final Tableau executive dashboard. Dashboard figures reflect the March 28, 2026 snapshot.

## Executive Takeaways

1. **Forecast fees are above the quarterly target.**  
   Forecast fees are approximately **$28.5M** against a **$24.3M** target, resulting in **117.2% forecast attainment**. This indicates that the current forecast is ahead of plan, although the result still depends on open opportunities converting as expected.

2. **The pipeline is large but concentrated in later stages.**  
   Open pipeline is approximately **$2.79B**, including **$1.11B in Commitment** and **$613.1M in Negotiation**. The probability-weighted pipeline is approximately **$1.81B**, showing that a significant share of total pipeline is already in higher-confidence stages.

3. **Lending and the Midwest represent the largest concentrations.**  
   Lending contributes approximately **$1.35B**, making it the largest product group. The Midwest has approximately **$813.9M** of open pipeline, followed by the Southeast at **$782.3M**. Leadership should consider this concentration when evaluating forecast dependency and resource coverage.

4. **Pipeline hygiene remains a material leadership concern.**  
   The dashboard identifies approximately **$21.6M in stale expected fees**, **122 past-due deals**, and **332 late-stage opportunities**. These indicators should drive relationship-manager follow-up and quarter-end deal reviews.

5. **Closed-won fees remain small relative to the forward forecast.**  
   Closed-won fees are approximately **$1.0M**, while most forecast value remains open. The positive forecast-attainment result should therefore be interpreted as an outlook rather than realized performance.

6. **The dataset supports a focused quarterly story.**  
   The processed mart contains 7,353 weekly snapshot rows, all mapped to `2026-Q1`. This supports weekly pipeline movement and quarter-end monitoring but does not yet provide a multi-quarter trend.

## Business Interpretation

The synthetic dataset is structured well for a portfolio dashboard because it shows the full lifecycle of pipeline management:

- opportunity creation
- weekly snapshot tracking
- stale opportunity identification
- late-stage risk monitoring
- target comparison
- RM follow-up prioritization

From a business perspective, the key story is not just how much pipeline exists, but whether the pipeline is active, forecastable, and supported by timely relationship-manager action.

## Dashboard Storyline

The Tableau dashboard answers:

- Where is pipeline concentrated by region and product group?
- Which deals are stale, past due, or at risk?
- Which relationship managers have the highest follow-up burden?
- How does open pipeline compare to fee and pipeline targets?
- Which deals need leadership attention before quarter-end?

## Notes

- This summary is based on synthetic portfolio data only.
- The processed mart is currently limited to one quarter of data, so trend analysis across multiple quarters is not yet available.
- Dashboard values may change when users apply region, product group, team, or snapshot-date filters.
