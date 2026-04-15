-- Task 1
-- For each warehouse, find its’ top three clients (those who brought in the most amount of business in
-- dollar terms to the warehouse).
WITH WarehouseClientOrders AS (
    SELECT DISTINCT STW.WarehouseID,
        CHP.ClientID,
        PO.OrderID,
        PO.[Value]
    FROM CLIENT_HAS_PURCHASEORDER AS CHP
        INNER JOIN PURCHASEORDER AS PO ON PO.OrderID = CHP.OrderID
        INNER JOIN SHIPMENT AS S ON S.OrderID = PO.OrderID
        INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW ON STW.ShipmentID = S.ShipmentID
),
WarehouseClientRevenue AS (
    SELECT WarehouseID,
        ClientID,
        SUM([Value]) AS TotalBusiness
    FROM WarehouseClientOrders
    GROUP BY WarehouseID,
        ClientID
),
RankedClients AS (
    SELECT WCR.WarehouseID,
        WCR.ClientID,
        WCR.TotalBusiness,
        ROW_NUMBER() OVER (
            PARTITION BY WCR.WarehouseID
            ORDER BY WCR.TotalBusiness DESC,
                WCR.ClientID
        ) AS ClientRank
    FROM WarehouseClientRevenue AS WCR
)
SELECT RC.WarehouseID,
    W.[Address],
    RC.ClientRank,
    RC.ClientID,
    C.CompanyName,
    RC.TotalBusiness
FROM RankedClients AS RC
    JOIN WAREHOUSE AS W ON W.WarehouseID = RC.WarehouseID
    JOIN CLIENT AS C ON C.ClientID = RC.ClientID
WHERE RC.ClientRank <= 3
ORDER BY RC.WarehouseID,
    RC.ClientRank,
    RC.ClientID;
-- WITH WarehouseClientOrders AS (SELECT DISTINCT STW.WarehouseID, CHP.ClientID, PO.OrderID, PO.[Value] FROM CLIENT_HAS_PURCHASEORDER AS CHP INNER JOIN PURCHASEORDER AS PO ON PO.OrderID = CHP.OrderID INNER JOIN SHIPMENT AS S ON S.OrderID = PO.OrderID INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW ON STW.ShipmentID = S.ShipmentID), WarehouseClientRevenue AS (SELECT WarehouseID, ClientID, SUM([Value]) AS TotalBusiness FROM WarehouseClientOrders GROUP BY WarehouseID, ClientID), RankedClients AS (SELECT WCR.WarehouseID, WCR.ClientID, WCR.TotalBusiness, ROW_NUMBER() OVER (PARTITION BY WCR.WarehouseID ORDER BY WCR.TotalBusiness DESC, WCR.ClientID) AS ClientRank FROM WarehouseClientRevenue AS WCR) SELECT RC.WarehouseID, W.[Address], RC.ClientRank, RC.ClientID, C.CompanyName, RC.TotalBusiness FROM RankedClients AS RC JOIN WAREHOUSE AS W ON W.WarehouseID = RC.WarehouseID JOIN CLIENT AS C ON C.ClientID = RC.ClientID WHERE RC.ClientRank <= 3 ORDER BY RC.WarehouseID, RC.ClientRank, RC.ClientID;
-- Task 2
-- Do warehouses located in Singapore have more businesses (in dollar terms) than warehouses in Los
-- Angeles, USA?
WITH WarehouseClientOrders AS (
    SELECT DISTINCT STW.WarehouseID,
        CHP.ClientID,
        PO.OrderID,
        PO.[Value]
    FROM CLIENT_HAS_PURCHASEORDER AS CHP
        INNER JOIN PURCHASEORDER AS PO ON PO.OrderID = CHP.OrderID
        INNER JOIN SHIPMENT AS S ON S.OrderID = PO.OrderID
        INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW ON STW.ShipmentID = S.ShipmentID
),
WarehouseCityRevenue AS (
    SELECT TRIM(s.value) AS City,
        SUM(WCO.[Value]) AS TotalBusiness
    FROM WarehouseClientOrders AS WCO
        INNER JOIN WAREHOUSE AS W ON W.WarehouseID = WCO.WarehouseID
        CROSS APPLY STRING_SPLIT(W.[Address], ',', 1) AS s
    WHERE s.ordinal = 2
    GROUP BY TRIM(s.value)
),
SELECT CASE
    WHEN (
        SELECT TotalBusiness
        FROM WarehouseCityRevenue
        WHERE City = 'Singapore'
    ) > (
        SELECT TotalBusiness
        FROM WarehouseCityRevenue
        WHERE City = 'Los Angeles'
    ) THEN 'Yes'
    ELSE 'No'
END AS IsSingaporeHigher;
-- WITH WarehouseClientOrders AS (SELECT DISTINCT STW.WarehouseID, CHP.ClientID, PO.OrderID, PO.[Value] FROM CLIENT_HAS_PURCHASEORDER AS CHP INNER JOIN PURCHASEORDER AS PO ON PO.OrderID = CHP.OrderID INNER JOIN SHIPMENT AS S ON S.OrderID = PO.OrderID INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW ON STW.ShipmentID = S.ShipmentID), WarehouseCityRevenue AS (SELECT TRIM(s.value) AS City, SUM(WCO.[Value]) AS TotalBusiness FROM WarehouseClientOrders AS WCO INNER JOIN WAREHOUSE AS W ON W.WarehouseID = WCO.WarehouseID CROSS APPLY STRING_SPLIT(W.[Address], ',', 1) AS s WHERE s.ordinal = 2 GROUP BY TRIM(s.value)) SELECT CASE WHEN ISNULL((SELECT TotalBusiness FROM WarehouseCityRevenue WHERE City = 'Singapore'), 0) > ISNULL((SELECT TotalBusiness FROM WarehouseCityRevenue WHERE City = 'Los Angeles'), 0) THEN 'Yes' ELSE 'No' END AS IsSingaporeHigher;
-- Verify
-- WITH WarehouseClientOrders AS (SELECT DISTINCT STW.WarehouseID, CHP.ClientID, PO.OrderID, PO.[Value] FROM CLIENT_HAS_PURCHASEORDER AS CHP INNER JOIN PURCHASEORDER AS PO ON PO.OrderID = CHP.OrderID INNER JOIN SHIPMENT AS S ON S.OrderID = PO.OrderID INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW ON STW.ShipmentID = S.ShipmentID), WarehouseCityRevenue AS (SELECT TRIM(s.value) AS City, SUM(WCO.[Value]) AS TotalBusiness FROM WarehouseClientOrders AS WCO INNER JOIN WAREHOUSE AS W ON W.WarehouseID = WCO.WarehouseID CROSS APPLY STRING_SPLIT(W.[Address], ',', 1) AS s WHERE s.ordinal = 2 GROUP BY TRIM(s.value)) SELECT * FROM WarehouseCityRevenue;
-- Task 3
-- What are the top three months in a year for the last two years that have the most purchase orders
-- created in the system?
SELECT TOP 3 DATENAME(month, OrderDate) AS [Month],
    YEAR(OrderDate) AS [Year],
    COUNT(OrderID) AS NumberOfPurchaseOrders
FROM PURCHASEORDER
WHERE OrderDate >= DATEADD(year, -2, GETDATE())
GROUP BY YEAR(OrderDate),
    DATENAME(month, OrderDate)
ORDER BY NumberOfPurchaseOrders DESC;
-- SELECT TOP 3 DATENAME(month, OrderDate) AS [Month],  YEAR(OrderDate) AS [Year],  COUNT(OrderID) AS NumberOfPurchaseOrders FROM   PURCHASEORDER WHERE   OrderDate >= DATEADD(year, -2, GETDATE()) GROUP BY   YEAR(OrderDate),   DATENAME(month, OrderDate) ORDER BY   NumberOfPurchaseOrders DESC;
-- Task 4
-- What is the average length of time (in terms of months) it takes for products ordered until the products
-- are delivered to warehouses?
-- Across ALL warehouses.
SELECT AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate))
FROM PURCHASEORDER PO,
    SHIPMENT S
WHERE PO.OrderID = S.OrderID;
-- SELECT AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) * 1.0) FROM PURCHASEORDER PO, SHIPMENT S WHERE PO.OrderID = S.OrderID;
-- Indiviudal warehouses.
WITH OrderDeliveryTime AS (
    SELECT PO.OrderID,
        PO.OrderDate,
        S.ActArrivalDate,
        STW.WarehouseID,
        DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) AS DeliveryTimeMonths
    FROM PURCHASEORDER PO
        INNER JOIN SHIPMENT S ON S.OrderID = PO.OrderID -- Added the missing join to SHIPMENT_TO_WAREHOUSE to get WarehouseID
        INNER JOIN SHIPMENT_TO_WAREHOUSE STW ON S.ShipmentID = STW.ShipmentID
)
SELECT WarehouseID,
    AVG(CAST(DeliveryTimeMonths AS FLOAT)) AS AvgDeliveryTimeMonths
FROM OrderDeliveryTime
GROUP BY WarehouseID;
-- WITH OrderDeliveryTime AS (SELECT PO.OrderID, PO.OrderDate, S.ActArrivalDate, STW.WarehouseID, DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) AS DeliveryTimeMonths FROM PURCHASEORDER PO INNER JOIN SHIPMENT S ON S.OrderID = PO.OrderID INNER JOIN SHIPMENT_TO_WAREHOUSE STW ON S.ShipmentID = STW.ShipmentID) SELECT WarehouseID, AVG(CAST(DeliveryTimeMonths AS FLOAT)) AS AvgDeliveryTimeMonths FROM OrderDeliveryTime GROUP BY WarehouseID;

-- Task 5
-- Which suppliers only supply products to warehouses in Singapore?

SELECT S.SupplierID,
       S.[Name] AS SupplierName
FROM SUPPLIER AS S
WHERE EXISTS (
    SELECT 1
    FROM SHIPMENT_HAS_SUPPLIER AS SHS
    INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW
        ON STW.ShipmentID = SHS.ShipmentID
    INNER JOIN WAREHOUSE AS W
        ON W.WarehouseID = STW.WarehouseID
    WHERE SHS.SupplierID = S.SupplierID
      AND W.[Address] LIKE '%Singapore%'
)
AND NOT EXISTS (
    SELECT 1
    FROM SHIPMENT_HAS_SUPPLIER AS SHS
    INNER JOIN SHIPMENT_TO_WAREHOUSE AS STW
        ON STW.ShipmentID = SHS.ShipmentID
    INNER JOIN WAREHOUSE AS W
        ON W.WarehouseID = STW.WarehouseID
    WHERE SHS.SupplierID = S.SupplierID
      AND W.[Address] NOT LIKE '%Singapore%'
)
ORDER BY S.SupplierID;

-- Task 6
-- Which suppliers do not supply any product to warehouses in Thailand
-- but have supplied all the products in warehouses in Singapore?

SELECT S.SupplierID, S.[Name]
FROM SUPPLIER S
WHERE S.SupplierID NOT IN (
    -- Suppliers who have supplied to Thailand warehouses
    SELECT SHS.SupplierID
    FROM SHIPMENT_HAS_SUPPLIER SHS
    INNER JOIN SHIPMENT SH ON SH.ShipmentID = SHS.ShipmentID
    INNER JOIN SHIPMENT_TO_WAREHOUSE STW ON STW.ShipmentID = SH.ShipmentID
    INNER JOIN WAREHOUSE W ON W.WarehouseID = STW.WarehouseID
    WHERE W.[Address] LIKE '%Thailand%'
)
AND (
    -- Count of distinct products this supplier sent to SG warehouses
    SELECT COUNT(DISTINCT I.ProductID)
    FROM SHIPMENT_HAS_SUPPLIER SHS
    INNER JOIN SHIPMENT SH ON SH.ShipmentID = SHS.ShipmentID
    INNER JOIN SHIPMENT_TO_WAREHOUSE STW ON STW.ShipmentID = SH.ShipmentID
    INNER JOIN WAREHOUSE W ON W.WarehouseID = STW.WarehouseID
    INNER JOIN SHIPITEM SI ON SI.ShipmentID = SH.ShipmentID
    INNER JOIN ITEM I ON I.ItemSerial = SI.ItemSerial
    WHERE W.[Address] LIKE '%Singapore%'
    AND SHS.SupplierID = S.SupplierID
) = (
    -- Total distinct products across ALL SG warehouses
    SELECT COUNT(DISTINCT I.ProductID)
    FROM SHIPMENT SH
    INNER JOIN SHIPMENT_TO_WAREHOUSE STW ON STW.ShipmentID = SH.ShipmentID
    INNER JOIN WAREHOUSE W ON W.WarehouseID = STW.WarehouseID
    INNER JOIN SHIPITEM SI ON SI.ShipmentID = SH.ShipmentID
    INNER JOIN ITEM I ON I.ItemSerial = SI.ItemSerial
    WHERE W.[Address] LIKE '%Singapore%'
);
