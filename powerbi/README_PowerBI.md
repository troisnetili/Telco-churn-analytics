# Power BI Dashboard

## Data source
Import `telco_churn_powerbi_data.csv`.

## Measures

```DAX
Total Customers = COUNTROWS('telco_churn_powerbi_data')

Churned Customers = CALCULATE([Total Customers], 'telco_churn_powerbi_data'[Churn] = "Yes")

Churn Rate = DIVIDE([Churned Customers], [Total Customers], 0)

High Risk Customers = SUM('telco_churn_powerbi_data'[predicted_high_risk])

Avg Churn Risk Score = AVERAGE('telco_churn_powerbi_data'[churn_risk_score])

Monthly Revenue at Risk =
CALCULATE(
    SUM('telco_churn_powerbi_data'[MonthlyCharges]),
    'telco_churn_powerbi_data'[predicted_high_risk] = 1,
    'telco_churn_powerbi_data'[Churn] = "No"
)
```

## Dashboard layout

**Top:** Total Customers | Churn Rate | High Risk Customers | Monthly Revenue at Risk

**Middle:** Churn Rate by Contract | Churn Rate by Internet Service

**Bottom:** Active high-risk customer table | Tenure vs Monthly Charges scatter plot

**Slicers:** Contract, InternetService, PaymentMethod

## Business purpose

The dashboard should answer three questions quickly:
1. How large is the churn problem?
2. Which customer segments show different churn rates?
3. Which active customers are currently flagged by the model for further investigation?
