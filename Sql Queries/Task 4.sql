-- Task 4: Detecting Anomalies in Sales Transactions
WITH Stats AS (
    SELECT 
        Product_line,
        AVG(Total) AS avg_total,
        STDDEV(Total) AS std_total
    FROM walmart
    GROUP BY Product_line
),
Flagged AS (
    SELECT 
        w.*,
        s.avg_total,
        s.std_total,
        CASE
            WHEN w.Total > s.avg_total + 1.5 * s.std_total THEN 'High Anomaly'
            WHEN w.Total < s.avg_total - 1.5 * s.std_total THEN 'Low Anomaly'
            ELSE 'Normal'
        END AS AnomalyFlag
    FROM walmart w
    JOIN Stats s ON w.Product_line = s.Product_line
)
SELECT Product_line, Branch, Total, Round(avg_total,2) As Average, round(std_total,2) as STD, AnomalyFlag
FROM Flagged;
