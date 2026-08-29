# E-Commerce Delivery & CX Risk Analytics

I built this project to understand how delivery reliability is connected to customer experience and whether delivery risk can be identified early enough for an operational team to act.

The analysis uses the Olist Brazilian e-commerce public dataset and combines delivery analysis, customer-review analysis, predictive risk modeling, Power BI, and a simulated A/B test.

## Questions

- How strongly are delivery delays associated with bad reviews?
- Which categories and states show higher delivery risk?
- Can customer-experience risk be identified before final delivery?
- Which orders should be prioritized for intervention?
- How could a proactive outreach experiment be designed?

## Tools

- Python
- SQL
- Power BI
- Statistics
- scikit-learn
- A/B Testing
- Monte Carlo Simulation

## What I did

### Delivery & customer experience

Starting from the Olist relational tables, I built a one-row-per-order analytical dataset after validating the joins and handling duplicate review records.

The final analytical cohort contained **95,832 delivered and reviewed orders**.

Late orders had a **54.1% bad-review rate**, compared with **9.2% for on-time orders**, giving a **5.86× rate ratio**.

### Early-warning risk model

I built a time-based early-warning model using information available before the final delivery outcome.

The logistic early-warning model achieved a **ROC-AUC of 0.637** on the held-out period.

The highest-risk 10% of scores had a **75.0% bad-review rate**, compared with **49.6% across the held-out test cohort**.

### Operational risk bands

The held-out orders were divided into Standard, Elevated and High risk bands.

The High-risk group contained **128 orders** and had a **75.0% bad-review rate**.

This group also had an average seller-customer distance of approximately **809 km**.

### A/B test design

I designed a simulated proactive-outreach experiment for the high-risk cohort.

The planning assumptions were:

- Control bad-review rate: 75%
- Assumed treatment bad-review rate: 63.75%
- α = 0.05
- Target power = 80%
- Required sample: 262 orders per arm
- Total sample: 524 orders
- 10,000 Monte Carlo simulations
- Chi-square significance testing

The **15% reduction is an assumed planning effect**, not an observed result from real customers.

## Business takeaway

The analysis suggests that delivery reliability is strongly associated with customer-review outcomes, while the early-warning model can be used to prioritize a smaller set of high-risk orders for operational attention.

The next step would be testing whether proactive outreach actually improves customer outcomes rather than treating the simulated experiment as proof of impact.

## Limitations

- Olist is a historical dataset rather than a live logistics feed.
- The early-warning checkpoint is reconstructed from historical timestamps.
- Geographic distance is estimated from ZIP-prefix coordinates.
- Review score is used as a proxy for customer experience.
- The predictive model is intended for prioritization and triage, not causal inference.
- The A/B test is simulated and uses an assumed treatment effect.

## Project structure

```text
notebooks/      Python analysis and modeling
ab_testing/     Experiment design and simulation
powerbi/        Power BI-ready data and dashboard material
outputs/        Final charts and analytical outputs
data/           Data documentation
sql/            SQL analysis
