-- Task 3:  Analyzing Customer Segmentation Based on Spending 
SELECT     CustomerID,    Gender,    Branch,    City,    Customer_type,    Total,    
CASE        
WHEN Total < 400 THEN 'Low'        
WHEN Total BETWEEN 400 AND 800 THEN 'Medium'        
ELSE 'High'    
END AS Spending_Level FROM walmart;	
