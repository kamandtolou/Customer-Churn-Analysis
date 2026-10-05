-- ==========================================
-- TOTAL CUSTOMER CHURN
-- ==========================================

SELECT count(*) as TotalCustomers, sum(Exited) as TotalCustomerChurn , sum(Exited) * 100.0 / count(*) as TotalChurnRate 
FROM Customers;

-- =========================================
-- 1. Churn by Gender
-- Business Question:
-- Which Gender has the highest churn rate?
-- =========================================

SELECT
    Gender,
    COUNT(*) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM Customers
GROUP BY Gender
ORDER BY ChurnRate DESC;


-- =========================================
-- 2. Churn by Age Group
-- Business Question:
-- Which age group has the highest churn rate?
-- =========================================

SELECT     
    CASE 
		WHEN age BETWEEN 18 AND 30 THEN '18-30'
		WHEN age BETWEEN 31 AND 40 THEN '31-40'
		WHEN age BETWEEN 41 AND 50 THEN '41-50'
		ELSE '+51'
	END
 AS AgeGroup, 
  count(*) AS TotalCustomets, 
   SUM(Exited) AS ChurnedCustomers, 
   ROUND(SUM(Exited) * 100.0 / count(*), 2) AS ChurnRate 

From Customers
Group BY CASE 
		WHEN age BETWEEN 18 AND 30 THEN '18-30'
		WHEN age BETWEEN 31 AND 40 THEN '31-40'
		WHEN age BETWEEN 41 AND 50 THEN '41-50'
		ELSE '+51'
	END 
ORDER BY ChurnRate DESC;

-- =========================================
-- 3. Churn by Geography
-- Business Question:
-- Which geographic region has the highest churn rate?
-- =========================================

SELECT 
Geography, count(*) AS TotalCustomers, sum(Exited) AS ChurnedCustomers, round(sum(Exited)* 100.0 / count(*),2) AS ChurnRate 
FROM Customers
GROUP BY Geography
ORDER BY ChurnRate DESC;

-- =====================================================
-- 4. Churn by Credit Score
-- Business Question:
-- Clients with how much Credit Score has the highest churn rate?
-- =========================================

SELECT  
CASE 
WHEN CreditScore BETWEEN 300 and 499 THEN 'Poor'
WHEN CreditScore BETWEEN 500 and 649 THEN 'Fair'
WHEN CreditScore BETWEEN 650 and 749 THEN 'Good'
WHEN CreditScore BETWEEN 750 and 850 THEN 'excellent'
else ''
END AS CreditScoreGroup,
count(*) AS TotalCustomers, 
sum(Exited) AS ChurnedCustomers, 
round(sum(Exited)* 100.0/ count(*),2) AS ChurnRate 
FROM Customers
GROUP BY 
CASE
WHEN CreditScore BETWEEN 300 and 499 THEN 'Poor'
WHEN CreditScore BETWEEN 500 and 649 THEN 'Fair'
WHEN CreditScore BETWEEN 650 and 749 THEN 'Good'
WHEN CreditScore BETWEEN 750 and 850 THEN 'excellent'
else ''
END
ORDER BY ChurnRate DESC;

-- ========================================================
-- 5. Churn by Balance
-- Business Question:
-- Clients with how much Balance has the highest churn rate?
-- ==========================================================

SELECT 
CASE 
WHEN Balance=0 THEN '0'
WHEN Balance BETWEEN 0 AND 50000 THEN '0-50k'
WHEN Balance BETWEEN 50000 and 100000 THEN '50k-100k'
WHEN Balance BETWEEN 100000 and 150000 THEN '100k-150k'
ELSE '+150k'
END 
AS BalanceGroup, 
count(*) AS TotalCustomers,
sum(Exited) AS ChurnedCostomers,
round(sum(Exited) * 100.0 / count(*),2) AS ChurnRate
From Customers
GROUP BY
CASE
WHEN Balance =0 THEN '0'
WHEN Balance BETWEEN 0 and 50000 THEN '0-50k'
WHEN Balance BETWEEN 50000 and 100000 THEN '50k-100k'
WHEN Balance BETWEEN 100000 and 150000 THEN '100k-150k'
ELSE '+150k'
END      
ORDER BY ChurnRate DESC;

-- ========================================================
-- 6. Churn by Tenure
-- Business Question:
-- Which Tenure has the highest churn rate?
-- ==========================================================
SELECT 
CASE 
WHEN Tenure BETWEEN 0 AND 2 THEN 'New Customers'
WHEN Tenure BETWEEN 3 AND 5 THEN 'Mid-term Customers'
WHEN Tenure BETWEEN 6 and 8 THEN 'Loyal Customers'
WHEN Tenure BETWEEN 9 and 10 THEN 'Long-term Customers'

END AS TenureGroup,
count(*) AS TotalCustomer,
sum(Exited) AS ChurnedCustomer,
round(sum(Exited) * 100.0 / count(*),2 )AS ChurnRate
FROM Customers
GROUP BY
CASE 
WHEN Tenure BETWEEN 0 AND 2 THEN 'new-customers'
WHEN Tenure BETWEEN 3 and 5 THEN 'mid-term customers'
WHEN Tenure BETWEEN 6 and 8 THEN 'loyal customers'
WHEN Tenure BETWEEN 9 and 10 THEN 'long-term customers'

END
ORDER BY ChurnRate DESC;

-- ========================================================
-- 7. Churn by NumberOfProdcuts
-- Business Question:
-- Clients with how many Number Of Prodcuts has the highest churn rate?
-- ==========================================================

SELECT 
NumOfProducts as NumberOfProdcuts, 
count(*) as TotalCustomers,
sum(Exited) as ChurnedCustomers,
round(sum( Exited )*100 / count(*) ) as ChurnedRate
FROM Customers
GROUP BY NumOfProducts;

-- ========================================================
-- 8. Churn by active status
-- Business Question:
-- Which activity status has the highest churn rate?
-- ==========================================================

SELECT 
CASE
WHEN IsActiveMember = 1 THEN 'ACTIVE'
ELSE 'NOT ACTIVE' END as status, 
count(*) as TotalCustomers,
sum(Exited) as ChurnedCustomers,
round(sum( Exited )*100 / count(*) ) as ChurnedRate
FROM Customers
GROUP BY IsActiveMember;
-- ===================================================================
-- 8. Churn by credit card holder
-- Business Question:
-- Do credit card holders have highest churn rate?
-- ==========================================================
SELECT 
CASE
WHEN HasCrCard = 1 THEN 'have credit card'
ELSE 'doesnt have credit card ' END as creditcardstatus , 
count(*) as TotalCustomers,
sum(Exited) as ChurnedCustomers,
round(sum( Exited )*100 / count(*) ) as ChurnedRate
FROM Customers
GROUP BY HasCrCard;
-- ====================================================================
-- 8. Churn by estimated salary
-- Business Question:
-- Which salary renge has the highest churn rate?
-- ==========================================================
SELECT 
CASE
WHEN EstimatedSalary BETWEEN 0 AND 50000 THEN 'LOW'
WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'FAIR'
ELSE 'HIGH'
END as Salary,
count(*) as totalCutomers,
sum(Exited) as totalChurn,
round(sum(Exited) * 100.00 / count(*),2) as churnRate
FROM Customers
GROUP BY CASE
WHEN EstimatedSalary BETWEEN 0 AND 50000 THEN 'LOW'
WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'FAIR'
ELSE 'HIGH'
END;

