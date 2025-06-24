--SEGMENTATION

--What is the total number of customers per segment?
SELECT Segment, COUNT(*) AS Number_of_Customers
FROM customers_segments$
GROUP BY Segment;

--What is the average income per segment?
SELECT Segment, AVG(Credit_Limit) AS Credit_Means
FROM customers_segments$
GROUP BY Segment;


--What is the total amount of transactions per segment?
SELECT Segment, SUM(Total_Trans_Amt) AS Total_amount
FROM customers_segments$
GROUP BY Segment;


--INDIVIDUAL ANALYSIS

--Who are the highest spending customers?
SELECT CLIENTNUM, Total_Trans_Amt
FROM customers_segments$
ORDER BY Total_Trans_Amt DESC

--Which customers have a credit limit > 15,000 and a low utilization rate (< 0.2)?
SELECT CLIENTNUM, Credit_Limit, Avg_Utilization_Ratio
FROM customers_segments$
WHERE Credit_Limit > 15000 AND Avg_Utilization_Ratio < 0.2;


--BEHAVIORAL ANALYSIS

--Who is the most active customer (number of transactions)?
SELECT CLIENTNUM, Total_Trans_Ct
FROM customers_segments$
ORDER BY Total_Trans_Ct DESC

--Which segment has the highest transaction volume?
SELECT Segment, SUM(Total_Trans_Ct) AS TotalTransactions
FROM customers_segments$
GROUP BY Segment
ORDER BY TotalTransactions DESC;

--MISSING OR INCONSISTENT DATA()

--Are there missing values ​​in any columns?
SELECT *
FROM customers_segments$
WHERE Credit_Limit IS NULL OR Total_Trans_Amt IS NULL;




