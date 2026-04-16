-- Task 4
-- What is the average length of time (in terms of months) it takes for products ordered until the products
-- are delivered to warehouses?
-- Across ALL warehouses.
-- #task 4
-- PO.OrderID ,PO.OrderDate, S.ActArrivalDate, S.ShipmentID, DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) AS DeliveryTimeMonths, AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate)) OVER() AS AvgTime
-- FROM PURCHASEORDER PO, SHIPMENT S
-- WHERE PO.OrderID = S.OrderID
-- GO
SELECT AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate))
FROM PURCHASEORDER PO,
    SHIPMENT S
WHERE PO.OrderID = S.OrderID;
-- SELECT AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) * 1.0) FROM PURCHASEORDER PO, SHIPMENT S WHERE PO.OrderID = S.OrderID;
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