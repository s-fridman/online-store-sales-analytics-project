# Online Store Sales Analytics

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/s-fridman/online-store-sales-analytics-project/blob/main/Online_Store_Data_Analysis.ipynb)  
[Open the interactive dashboard on Tableau Public](https://public.tableau.com/views/Sessions_17938809790950/SalesCustomerBehaviorDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

End-to-end data analysis project about user behavior, sales and audience segments of an online store. The data was extracted from BigQuery with SQL, analyzed in Python and visualized in Tableau.

## Business questions

- Which markets, channels and devices bring the most sales?
- Do sales depend on traffic, season and day of the week?
- Do registered users spend more than guests?
- Are there differences between traffic channels and continents?

## Data

- Source: BigQuery dataset `DA` (sessions, orders, products, accounts)
- Period: 1 November 2020 - 31 January 2021 (92 days)
- Size: 349,545 sessions and 33,538 orders
- Note: order data is missing for 28-31 January 2021

## Methods

- **SQL (BigQuery):** several tables were joined with LEFT JOIN, so that sessions of guests and sessions without orders were not lost.
- **Python (pandas, seaborn, matplotlib):** data cleaning, missing values, exploratory analysis, sales dynamics, pivot tables.
- **Statistics (scipy, statsmodels):** Spearman correlation, Shapiro-Wilk, Wilcoxon signed-rank, Friedman and Mann-Whitney U tests, z-test for two proportions.
- **Tableau:** interactive dashboard with parameters and filters.

## Key findings

- Total sales are about $32 million. The USA is the core market (about 44% of sales).
- Sales follow traffic (Spearman rho = 0.90), and conversion is almost the same in all channels and on all devices. Growth mainly depends on the number of sessions.
- Organic Search is the largest channel (38% of sessions with a known channel).
- Tuesday and Wednesday are the best days, weekends are 30-36% lower. December has the peak.
- Registered users do not spend more per session than guests (Wilcoxon test, p = 0.134).

## Tools

Python, pandas, seaborn, matplotlib, SciPy, statsmodels, Google BigQuery, Tableau
