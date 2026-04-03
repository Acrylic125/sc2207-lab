
#task 4
PO.OrderID ,PO.OrderDate, S.ActArrivalDate, S.ShipmentID, DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) AS DeliveryTimeMonths, AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate)) OVER() AS AvgTime
FROM PURCHASEORDER PO, SHIPMENT S
WHERE PO.OrderID = S.OrderID
GO

SELECT AVG(DATEDIFF(month, PO.OrderDate, S.ActArrivalDate) )
FROM PURCHASEORDER PO , SHIPMENT S
WHERE PO.OrderID = S.OrderID
GO