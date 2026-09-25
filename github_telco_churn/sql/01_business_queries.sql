-- Q1 - Overall churn rate
SELECT COUNT(*) total_customers, SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) churned_customers, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers;

-- Q2 - Churn rate by contract
SELECT Contract, COUNT(*) customers, SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) churned, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers GROUP BY Contract ORDER BY churn_rate_pct DESC;

-- Q3 - Churn by internet service
SELECT InternetService, COUNT(*) customers, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers GROUP BY InternetService ORDER BY churn_rate_pct DESC;

-- Q4 - Churn by tenure bucket
SELECT CASE WHEN tenure<=6 THEN '0-6 months' WHEN tenure<=12 THEN '7-12 months' WHEN tenure<=24 THEN '13-24 months' WHEN tenure<=48 THEN '25-48 months' ELSE '49+ months' END tenure_bucket, COUNT(*) customers, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers GROUP BY tenure_bucket ORDER BY MIN(tenure);

-- Q5 - Active customers with high-risk profile
SELECT customerID, tenure, Contract, MonthlyCharges, InternetService FROM customers WHERE Contract='Month-to-month' AND tenure<6 AND Churn='No' ORDER BY MonthlyCharges DESC LIMIT 10;

-- Q6 - Churn by payment method
SELECT PaymentMethod, COUNT(*) customers, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers GROUP BY PaymentMethod ORDER BY churn_rate_pct DESC;

-- Q7 - Tech support and churn
SELECT TechSupport, COUNT(*) customers, ROUND(100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) churn_rate_pct FROM customers WHERE InternetService!='No' GROUP BY TechSupport ORDER BY churn_rate_pct DESC;

-- Q8 - Missing TotalCharges
SELECT customerID, tenure, MonthlyCharges, TotalCharges FROM customers WHERE TRIM(TotalCharges)='' OR TotalCharges IS NULL;

-- Q9 - Duplicate customer IDs
SELECT customerID, COUNT(*) cnt FROM customers GROUP BY customerID HAVING COUNT(*)>1;

