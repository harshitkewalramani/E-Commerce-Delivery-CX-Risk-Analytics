# Used-Car Market Intelligence

I built this project to look at the used-car market from a business point of view: what is worth acquiring, how prices behave across segments, how accurately prices can be estimated, and which states look more promising for expansion.

## What I wanted to answer

- Which brand × age × fuel segments look attractive for inventory acquisition?
- Which segments show more stable pricing?
- How well can used-car prices be modeled?
- Which states look more promising for expansion?

## Tools

- Python
- SQL
- Advanced Excel
- Power BI
- Tableau
- scikit-learn

## What I did

### 1. Inventory analysis

I scored vehicle segments using observed price retention, selling price, listing volume and pricing stability.

The highest-ranked segment was:

**Toyota · 3–5 years · Diesel — 86.4/100**

This was based on **15,244 CarDekho records**.

### 2. Price modeling

I compared:

- Linear Regression
- Gradient Boosting

The models were evaluated using **5-fold GroupKFold by vehicle model** to reduce leakage between related vehicle records.

The final models reduced cross-validated MAE by **62% versus a fold-specific median-price baseline**.

### 3. Forecasting

I also added a forecasting view for the Toyota + Diesel segment.

Because the dataset does not contain listing or sale dates, the forecast is an **age-trajectory projection**, rather than a calendar-time forecast.

### 4. Power BI dashboard

The dashboard brings together:

- pricing trends
- segment attractiveness
- price forecasts
- inventory acquisition signals
- state expansion opportunity

### 5. Tableau

I rebuilt the inventory-scoring dashboard in Tableau Public and added a geographic view of state-level opportunity scores.

The highest-ranked state in the expansion snapshot was:

**Uttar Pradesh — 86.7/100**

This should be treated as a directional supply-potential proxy rather than a forecast of future inventory.

## Key business takeaways

**What to acquire:** Toyota · 3–5 years · Diesel

**Where to focus:** Uttar Pradesh

**What to price cautiously:** Ford · 3–5 years · Diesel, which showed higher pricing variability and should be reviewed manually.

## Project structure

```text
notebooks/      Python analysis
sql/            SQL queries
tableau/        Tableau workbook
powerbi/        Dashboard files/screenshots
outputs/        Charts and model results
data/           Data notes / source information
