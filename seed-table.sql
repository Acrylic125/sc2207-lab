-- 1. WAREHOUSE
INSERT INTO WAREHOUSE (WarehouseID, [Address], [Size], Temperature, Security) VALUES
(1, '123 Changi North, Singapore', '50000 sqft', 'Ambient', 'High'),
(2, '45 Tuas South, Singapore', '30000 sqft', 'Refrigerated', 'Medium'),
(3, '88 Jurong Island, Singapore', '20000 sqft', 'Frozen', 'High'),
(4, '12 Sunset Blvd, Los Angeles, USA', '100000 sqft', 'Ambient', 'High'),
(5, '55 Hollywood Way, Los Angeles, USA', '75000 sqft', 'Ambient', 'Medium'),
(6, '99 Alpine Rd, Zurich', '15000 sqft', 'Refrigerated', 'High'),
(7, '101 Bangkok Central, Thailand', '60000 sqft', 'Ambient', 'High'),
(8, '22 Sakura Ln, Tokyo', '40000 sqft', 'Ambient', 'Medium');

-- 2. ZONE
INSERT INTO ZONE (WarehouseID, ZoneType) VALUES
(1, 'Receiving'), (1, 'Bulk Storage'), (2, 'Picking'), (3, 'Shipping Dock'),
(4, 'Packing'), (5, 'Receiving'), (6, 'Bulk Storage'), (7, 'Hazardous');

-- 3. LOCATION
INSERT INTO LOCATION (LocationCode, WarehouseID, ZoneType) VALUES
('A-01', 1, 'Receiving'), ('B-05', 1, 'Bulk Storage'), ('C-10', 2, 'Picking'),
('D-02', 3, 'Shipping Dock'), ('E-11', 4, 'Packing'), ('F-09', 5, 'Receiving'),
('G-03', 6, 'Bulk Storage'), ('H-07', 7, 'Hazardous');

-- 4. CLIENT
INSERT INTO CLIENT (ClientID, ServiceTier, CompanyName, StartDate, ContactPerson) VALUES
(1, 'Platinum', 'TechGiant Corp', '2023-01-15', 'Alice Tan'),
(2, 'Gold', 'FreshFoods Ltd', '2023-03-20', 'Bob Miller'),
(3, 'Silver', 'AutoParts Inc', '2023-06-10', 'Charlie Day'),
(4, 'Bronze', 'RetailWorks', '2023-08-01', 'Diana Prince'),
(5, 'Platinum', 'Global Pharma', '2022-11-12', 'Edward Norton'),
(6, 'Silver', 'EcoBuild', '2024-01-05', 'Fiona Gallagher'),
(7, 'Gold', 'SkyHigh Electronics', '2023-05-22', 'George Bluth'),
(8, 'Platinum', 'Luxury Goods Co', '2023-09-30', 'Hannah Abbott');

-- 5. PRODUCT
INSERT INTO PRODUCT (ProductID, [Name], Brand, Cost, Category, Price) VALUES
(101, 'Smartphone X', 'TechBrand', 400.00, 'Electronics', 899.00),
(102, 'Frozen Peas', 'GreenFarm', 1.50, 'Food', 3.50),
(103, 'Brake Pads', 'FastStop', 45.00, 'Automotive', 120.00),
(104, 'Cotton T-Shirt', 'BasicWear', 5.00, 'Apparel', 19.99),
(105, 'Insulin Vials', 'MediCure', 50.00, 'Pharma', 150.00),
(106, 'Solar Panel', 'SunPower', 200.00, 'Energy', 450.00),
(107, 'Organic Milk', 'DairyPure', 2.00, 'Food', 4.50),
(108, 'Leather Bag', 'Luxe', 300.00, 'Luxury', 1200.00);

-- 6. INVENTORY
INSERT INTO INVENTORY (InventorySerial, WarehouseID, ProductID, ClientID, RQty, HQty, SQty, OQty, [Location]) VALUES
(1001, 1, 101, 1, 10, 100, 90, 200, 'LOC-01'),
(1002, 1, 102, 2, 10, 100, 90, 200, 'LOC-02'),
(1003, 1, 103, 3, 10, 100, 90, 200, 'LOC-03'),
(1004, 4, 101, 1, 10, 100, 90, 200, 'LOC-04'),
(1005, 4, 104, 4, 10, 100, 90, 200, 'LOC-05'),
(1006, 7, 106, 6, 10, 100, 90, 200, 'LOC-06'),
(1007, 2, 107, 2, 10, 100, 90, 200, 'LOC-07'),
(1008, 3, 108, 8, 10, 100, 90, 200, 'LOC-08');

-- 7. INVENTORY_LOG
INSERT INTO INVENTORY_LOG (InventorySerial, WarehouseID, ProductID, ClientID, [Timestamp], Movement, Reason) VALUES
(1001, 1, 101, 1, '2026-03-01 09:00:00', 'Receipt', 'New Stock Arrival'),
(1002, 2, 102, 2, '2026-03-02 10:30:00', 'Pick', 'Order Fulfillment'),
(1003, 4, 103, 3, '2026-03-03 14:15:00', 'Adjustment', 'Damage Discovery'),
(1004, 5, 104, 4, '2026-03-04 08:45:00', 'Putaway', 'Dock to Shelf'),
(1005, 3, 105, 5, '2026-03-05 11:00:00', 'Receipt', 'Supplier Delivery'),
(1006, 6, 106, 6, '2026-03-06 16:20:00', 'Pick', 'Outbound Shipment'),
(1007, 2, 107, 2, '2026-03-07 07:10:00', 'Adjustment', 'Cycle Count'),
(1008, 1, 108, 8, '2026-03-08 13:00:00', 'Receipt', 'Restock');

-- 8. SUPPLIER
INSERT INTO SUPPLIER (SupplierID, Country, [Name], PaymentTerms) VALUES
(1, 'China', 'SG-Only Supplier', 'Net 30'), -- Designed for Q5
(2, 'USA', 'Global Supply Co', 'Net 15'),
(3, 'Germany', 'EuroParts', 'COD'),
(4, 'Thailand', 'Thai Logistics', 'Net 30'),
(5, 'Singapore', 'Merlion Mfg', 'Net 30'),
(6, 'Japan', 'Nippon Export', 'Net 30'),
(7, 'India', 'Bharat Tech', 'Net 45'),
(8, 'Italy', 'Venezia Goods', 'Net 30');

-- 9. SUPPLY
INSERT INTO SUPPLY ([Period], ProductID, ClientID, SupplierID, LeadTime) VALUES
('2026-Q1', 101, 1, 1, 14),
('2026-Q1', 102, 2, 2, 7),
('2026-Q1', 103, 3, 3, 21),
('2026-Q1', 104, 4, 4, 30),
('2026-Q1', 105, 5, 5, 10),
('2026-Q1', 106, 6, 6, 25),
('2026-Q1', 107, 2, 2, 5),
('2026-Q1', 108, 8, 8, 45);

-- 10. PURCHASEORDER
INSERT INTO PURCHASEORDER (OrderID, OrderDate, [Status], [Value]) VALUES
(5001, '2024-05-10', 'Fully Received', 100000.00),
(5002, '2024-05-15', 'Fully Received', 150000.00),
(5003, '2024-06-20', 'Fully Received', 80000.00),
(5004, '2025-11-01', 'Fully Received', 50000.00),
(5005, '2025-11-15', 'Fully Received', 90000.00),
(5006, '2025-12-05', 'Fully Received', 120000.00),
(5007, '2026-01-10', 'Submitted', 200000.00),
(5008, '2026-01-20', 'Submitted', 300000.00);

-- 11. CLIENT_HAS_PURCHASEORDER
INSERT INTO CLIENT_HAS_PURCHASEORDER (ClientID, OrderID) VALUES
(1, 5001), (2, 5002), (3, 5003), (4, 5004), (1, 5005), (6, 5006), (2, 5007), (8, 5008);

-- 12. ITEM
INSERT INTO ITEM (ItemSerial, ProductID) VALUES
('SN-1001', 101), ('SN-1002', 102), ('SN-1003', 103), ('SN-1004', 104),
('SN-1005', 105), ('SN-1006', 106), ('SN-1007', 107), ('SN-1008', 108);

-- 13. ORDERITEM
INSERT INTO ORDERITEM (ItemSerial, OrderID, ExpDelDate, UnitPrice, OrderedQty) VALUES
('SN-1001', 5001, '2026-02-15', 400.00, 100),
('SN-1002', 5002, '2026-02-12', 1.50, 8000),
('SN-1003', 5003, '2026-03-01', 45.00, 180),
('SN-1004', 5004, '2026-03-15', 5.00, 600),
('SN-1005', 5005, '2026-03-10', 50.00, 1200),
('SN-1006', 5006, '2026-04-01', 200.00, 10),
('SN-1007', 5007, '2026-03-20', 2.00, 12500),
('SN-1008', 5008, '2026-04-10', 300.00, 180);

-- 14. SHIPMENT
INSERT INTO SHIPMENT (ShipmentID, ExpShippedDate, ActShippedDate, OriginalLocation, TrackingNum, ShippedDate, OrderID) VALUES
-- On time (Lead time ~1 month)
(7001, '2024-05-11', '2024-05-11', 'China Port', 'TRK001', '2024-05-11', 5001), 
-- Delayed > 6 months (Q7)
(7002, '2024-05-16', '2024-12-20', 'Suez Canal', 'TRK002', '2024-05-16', 5002), 
(7003, '2024-06-21', '2024-06-25', 'Hamburg', 'TRK003', '2024-06-21', 5003),
(7004, '2025-11-02', '2025-11-05', 'Vietnam', 'TRK004', '2025-11-02', 5004),
-- Delayed > 6 months (Q7)
(7005, '2025-11-16', '2026-06-30', 'Panama', 'TRK005', '2025-11-16', 5005),
(7006, '2025-12-06', '2025-12-10', 'Kyoto', 'TRK006', '2025-12-06', 5006),
(7007, '2026-01-11', '2026-01-15', 'Mumbai', 'TRK007', '2026-01-11', 5007),
(7008, '2026-01-21', '2026-01-25', 'Milan', 'TRK008', '2026-01-21', 5008);

-- 15. SHIPITEM
INSERT INTO SHIPITEM (ItemSerial, ShipmentID, ShippedQty, ExpArrDate) VALUES
('SN-1001', 7001, 100, '2026-02-16'), ('SN-1002', 7002, 8000, '2026-02-13'),
('SN-1003', 7003, 180, '2026-03-05'), ('SN-1004', 7004, 600, '2026-03-20'),
('SN-1005', 7005, 1200, '2026-03-15'), ('SN-1006', 7006, 10, '2026-04-10'),
('SN-1007', 7007, 12500, '2026-03-25'), ('SN-1008', 7008, 180, '2026-04-20');

-- 16. STAFF & EMPLOYEE & DRIVER
INSERT INTO STAFF (StaffID, [Name], [Type], HireDate) VALUES
(1, 'John Doe', 'Warehouse', '2020-01-01'), (2, 'Jane Smith', 'Driver', '2021-05-12'),
(3, 'Mike Ross', 'Warehouse', '2022-03-15'), (4, 'Rachel Zane', 'Driver', '2022-06-01'),
(5, 'Harvey Specter', 'Warehouse', '2019-11-20'), (6, 'Donna Paulsen', 'Driver', '2020-08-14'),
(7, 'Louis Litt', 'Warehouse', '2021-02-10'), (8, 'Jessica Pearson', 'Driver', '2018-04-05');

INSERT INTO EMPLOYEE (StaffID, Certification, WarehouseID) VALUES
(1, 'Forklift Operator', 1), (3, 'Hazmat', 2), (5, 'Safety Officer', 3), (7, 'Forklift Operator', 4);

INSERT INTO DRIVER (StaffID, LicenseNumber, LicenseExpiration, VehicleID) VALUES
(2, 'DL-9988', '2028-12-31', 101), (4, 'DL-7766', '2027-05-15', 102),
(6, 'DL-5544', '2029-01-20', 103), (8, 'DL-3322', '2026-11-10', 104);

-- 17. STOP
INSERT INTO STOP ([Sequence], RouteID, ActArrTime, EstArrTime) VALUES
(1, 101, '2026-03-20 09:00:00', '2026-03-20 08:45:00'),
(2, 101, '2026-03-20 11:30:00', '2026-03-20 11:00:00'),
(1, 102, '2026-03-20 08:30:00', '2026-03-20 08:30:00'),
(2, 102, NULL, '2026-03-20 14:00:00'),
(1, 103, '2026-03-20 10:00:00', '2026-03-20 10:00:00'),
(1, 104, '2026-03-21 09:00:00', '2026-03-21 09:00:00'),
(1, 105, NULL, '2026-03-21 13:00:00'),
(1, 106, NULL, '2026-03-22 08:00:00');

-- 18. DELIVERY
INSERT INTO DELIVERY ([Date], WarehouseID, VehicleID, ShipmentID, RouteID) VALUES
('2026-03-20', 1, 101, 7001, 101),
('2026-03-20', 2, 102, 7002, 102),
('2026-03-20', 3, 103, 7003, 103),
('2026-03-21', 4, 104, 7004, 104),
('2026-03-21', 5, 105, 7005, 105),
('2026-03-22', 6, 106, 7006, 106),
('2026-03-23', 7, 107, 7007, 107),
('2026-03-24', 8, 108, 7008, 108);

-- 19. SUPPLIER_HAS_PURCHASEORDER
INSERT INTO SUPPLIER_HAS_PURCHASEORDER (OrderID, SupplierID) VALUES
(5001, 1), (5002, 2), (5003, 3), (5004, 4), (5005, 5), (5006, 6), (5007, 2), (5008, 8);

-- 20. SHIPMENT_HAS_SUPPLIER
INSERT INTO SHIPMENT_HAS_SUPPLIER (ShipmentID, SupplierID) VALUES
(7001, 1), (7002, 1), (7003, 2), (7004, 2), (7005, 1), (7006, 4), (7007, 1), (7008, 1);

-- 21. SHIPMENT_TO_WAREHOUSE
INSERT INTO SHIPMENT_TO_WAREHOUSE (ShipmentID, WarehouseID) VALUES
(7001, 1), -- Singapore
(7002, 1), -- Singapore
(7003, 4), -- LA USA
(7004, 4), -- LA USA
(7005, 1), -- Singapore
(7006, 7), -- Thailand
(7007, 2), -- Singapore
(7008, 3); -- Singapore
