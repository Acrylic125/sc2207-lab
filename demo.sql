SELECT TOP 3
    DATENAME(month, OrderDate) AS [Month],
    YEAR(OrderDate) AS [Year],
    COUNT(OrderID) AS NumberOfPurchaseOrders
FROM 
    PURCHASEORDER
WHERE 
    OrderDate >= DATEADD(year, -2, GETDATE())
GROUP BY 
    YEAR(OrderDate), 
    DATENAME(month, OrderDate)
ORDER BY 
    NumberOfPurchaseOrders DESC;