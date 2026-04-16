-- 1. WAREHOUSE
INSERT INTO WAREHOUSE (
        WarehouseID,
        [Address],
        [Size],
        Temperature,
        Security
    )
VALUES (
        1,
        '123 Changi North, Singapore',
        '50000 sqft',
        'Ambient',
        'High'
    ),
    (
        2,
        '45 Tuas South, Singapore',
        '30000 sqft',
        'Refrigerated',
        'Medium'
    ),
    (
        3,
        '88 Jurong Island, Singapore',
        '20000 sqft',
        'Frozen',
        'High'
    ),
    (
        4,
        '12 Sunset Blvd, Los Angeles, USA',
        '100000 sqft',
        'Ambient',
        'High'
    ),
    (
        5,
        '55 Hollywood Way, Los Angeles, USA',
        '75000 sqft',
        'Ambient',
        'Medium'
    ),
    (
        6,
        '99 Alpine Rd, Zurich',
        '15000 sqft',
        'Refrigerated',
        'High'
    ),
    (
        7,
        '101 Bangkok Central, Thailand',
        '60000 sqft',
        'Ambient',
        'High'
    ),
    (
        8,
        '22 Sakura Ln, Tokyo',
        '40000 sqft',
        'Ambient',
        'Medium'
    );
-- 2. ZONE
INSERT INTO ZONE (WarehouseID, ZoneType)
VALUES (1, 'Receiving'),
    (1, 'Bulk Storage'),
    (2, 'Picking'),
    (3, 'Shipping Dock'),
    (4, 'Packing'),
    (5, 'Receiving'),
    (6, 'Bulk Storage'),
    (7, 'Hazardous');
-- 3. LOCATION
INSERT INTO LOCATION (LocationCode, WarehouseID, ZoneType)
VALUES ('A-01', 1, 'Receiving'),
    ('B-05', 1, 'Bulk Storage'),
    ('C-10', 2, 'Picking'),
    ('D-02', 3, 'Shipping Dock'),
    ('E-11', 4, 'Packing'),
    ('F-09', 5, 'Receiving'),
    ('G-03', 6, 'Bulk Storage'),
    ('H-07', 7, 'Hazardous');
-- 4. CLIENT
INSERT INTO CLIENT (
        ClientID,
        ServiceTier,
        CompanyName,
        StartDate,
        ContactPerson
    )
VALUES (
        1,
        'Platinum',
        'TechGiant Corp',
        '2023-01-15',
        'Alice Tan'
    ),
    (
        2,
        'Gold',
        'FreshFoods Ltd',
        '2023-03-20',
        'Bob Miller'
    ),
    (
        3,
        'Silver',
        'AutoParts Inc',
        '2023-06-10',
        'Charlie Day'
    ),
    (
        4,
        'Bronze',
        'RetailWorks',
        '2023-08-01',
        'Diana Prince'
    ),
    (
        5,
        'Platinum',
        'Global Pharma',
        '2022-11-12',
        'Edward Norton'
    ),
    (
        6,
        'Silver',
        'EcoBuild',
        '2024-01-05',
        'Fiona Gallagher'
    ),
    (
        7,
        'Gold',
        'SkyHigh Electronics',
        '2023-05-22',
        'George Bluth'
    ),
    (
        8,
        'Platinum',
        'Luxury Goods Co',
        '2023-09-30',
        'Hannah Abbott'
    );
-- 5. PRODUCT
INSERT INTO PRODUCT (ProductID, [Name], Brand, Cost, Category, Price)
VALUES (
        101,
        'Smartphone X',
        'TechBrand',
        400.00,
        'Electronics',
        899.00
    ),
    (
        102,
        'Frozen Peas',
        'GreenFarm',
        1.50,
        'Food',
        3.50
    ),
    (
        103,
        'Brake Pads',
        'FastStop',
        45.00,
        'Automotive',
        120.00
    ),
    (
        104,
        'Cotton T-Shirt',
        'BasicWear',
        5.00,
        'Apparel',
        19.99
    ),
    (
        105,
        'Insulin Vials',
        'MediCure',
        50.00,
        'Pharma',
        150.00
    ),
    (
        106,
        'Solar Panel',
        'SunPower',
        200.00,
        'Energy',
        450.00
    ),
    (
        107,
        'Organic Milk',
        'DairyPure',
        2.00,
        'Food',
        4.50
    ),
    (
        108,
        'Leather Bag',
        'Luxe',
        300.00,
        'Luxury',
        1200.00
    );
-- 6. INVENTORY
INSERT INTO INVENTORY (
        InventorySerial,
        WarehouseID,
        ProductID,
        ClientID,
        RQty,
        HQty,
        SQty,
        OQty,
        [Location]
    )
VALUES (1001, 1, 101, 1, 10, 100, 90, 200, 'LOC-01'),
    (1002, 1, 102, 2, 10, 100, 90, 200, 'LOC-02'),
    (1003, 1, 103, 3, 10, 100, 90, 200, 'LOC-03'),
    (1004, 4, 101, 1, 10, 100, 90, 200, 'LOC-04'),
    (1005, 4, 104, 4, 10, 100, 90, 200, 'LOC-05'),
    (1006, 7, 106, 6, 10, 100, 90, 200, 'LOC-06'),
    (1007, 2, 107, 2, 10, 100, 90, 200, 'LOC-07'),
    (1008, 3, 108, 8, 10, 100, 90, 200, 'LOC-08');
-- 7. INVENTORY_LOG
INSERT INTO INVENTORY_LOG (
        InventorySerial,
        WarehouseID,
        ProductID,
        ClientID,
        [Timestamp],
        Movement,
        Reason
    )
VALUES (
        1001,
        1,
        101,
        1,
        '2026-03-01 09:00:00',
        'Receipt',
        'New Stock Arrival'
    ),
    (
        1002,
        2,
        102,
        2,
        '2026-03-02 10:30:00',
        'Pick',
        'Order Fulfillment'
    ),
    (
        1003,
        4,
        103,
        3,
        '2026-03-03 14:15:00',
        'Adjustment',
        'Damage Discovery'
    ),
    (
        1004,
        5,
        104,
        4,
        '2026-03-04 08:45:00',
        'Putaway',
        'Dock to Shelf'
    ),
    (
        1005,
        3,
        105,
        5,
        '2026-03-05 11:00:00',
        'Receipt',
        'Supplier Delivery'
    ),
    (
        1006,
        6,
        106,
        6,
        '2026-03-06 16:20:00',
        'Pick',
        'Outbound Shipment'
    ),
    (
        1007,
        2,
        107,
        2,
        '2026-03-07 07:10:00',
        'Adjustment',
        'Cycle Count'
    ),
    (
        1008,
        1,
        108,
        8,
        '2026-03-08 13:00:00',
        'Receipt',
        'Restock'
    );
-- 8. SUPPLIER
INSERT INTO SUPPLIER (SupplierID, Country, [Name], PaymentTerms)
VALUES (1, 'China', 'SG-Only Supplier', 'Net 30'),
    (2, 'USA', 'Global Supply Co', 'Net 15'),
    (3, 'Germany', 'EuroParts', 'COD'),
    (4, 'Thailand', 'Thai Logistics', 'Net 30'),
    (5, 'Singapore', 'Merlion Mfg', 'Net 30'),
    (6, 'Japan', 'Nippon Export', 'Net 30'),
    (7, 'India', 'Bharat Tech', 'Net 45'),
    (8, 'Italy', 'Venezia Goods', 'Net 30');
-- 9. SUPPLY
INSERT INTO SUPPLY (
        [Period],
        ProductID,
        ClientID,
        SupplierID,
        LeadTime
    )
VALUES ('2026-Q1', 101, 1, 1, 14),
    ('2026-Q1', 102, 2, 2, 7),
    ('2026-Q1', 103, 3, 3, 21),
    ('2026-Q1', 104, 4, 4, 30),
    ('2026-Q1', 105, 5, 5, 10),
    ('2026-Q1', 106, 6, 6, 25),
    ('2026-Q1', 107, 2, 2, 5),
    ('2026-Q1', 108, 8, 8, 45);
--- 10. PURCHASEORDER
INSERT INTO PURCHASEORDER (OrderID, OrderDate, [Status], [Value])
VALUES (
        5001,
        '2024-01-05',
        'Draft',
        40000.00
    ),
    (
        5002,
        '2024-01-10',
        'Submitted',
        28500.00
    ),
    (
        5003,
        '2024-02-01',
        'Cancelled',
        27500.00
    ),
    (
        5004,
        '2024-01-15',
        'Confirmed',
        48000.00
    ),
    (
        5005,
        '2024-01-18',
        'Confirmed',
        15750.00
    ),
    (
        5006,
        '2024-01-20',
        'Partially Received',
        21000.00
    ),
    (
        5007,
        '2024-02-05',
        'Fully Received',
        16200.00
    ),
    (
        5008,
        '2024-02-10',
        'Fully Received',
        54600.00
    ),
    (5009, '2024-03-01', 'Fully Received', 36000.00),
    (5010, '2024-03-10', 'Fully Received', 22400.00),
    (5011, '2024-03-18', 'Fully Received', 47250.00),
    (5012, '2024-04-02', 'Fully Received', 31500.00),
    (5013, '2024-04-15', 'Fully Received', 58500.00),
    (5014, '2025-06-10', 'Submitted', 39800.00),
    (5015, '2025-06-22', 'Confirmed', 42600.00),
    (5016, '2025-11-03', 'Partially Received', 51250.00),
    (5017, '2026-02-14', 'Draft', 28900.00);
-- 11. CLIENT_HAS_PURCHASEORDER
INSERT INTO CLIENT_HAS_PURCHASEORDER (ClientID, OrderID)
VALUES (1, 5001),
    (2, 5002),
    (3, 5003),
    (1, 5004),
    (5, 5005),
    (4, 5006),
    (3, 5007),
    (8, 5008),
    (2, 5009),
    (7, 5010),
    (5, 5011),
    (6, 5012),
    (1, 5013);
-- 12. ITEM (Added SN-1009 to SN-1015)
INSERT INTO ITEM (ItemSerial, ProductID)
VALUES ('SN-1001', 101),
    ('SN-1002', 102),
    ('SN-1003', 106),
    ('SN-1004', 103),
    ('SN-1005', 105),
    ('SN-1006', 104),
    ('SN-1007', 107),
    ('SN-1008', 108),
    ('SN-1009', 102),
    ('SN-1010', 101),
    ('SN-1011', 105),
    ('SN-1012', 106),
    ('SN-1013', 101);
-- 13. ORDERITEM (Mapping the new items to the orders)
INSERT INTO ORDERITEM (
        ItemSerial,
        OrderID,
        ExpDelDate,
        UnitPrice,
        OrderedQty
    )
VALUES ('SN-1001', 5001, NULL, 80.00, 500),
    ('SN-1002', 5002, NULL, 95.00, 300),
    ('SN-1003', 5003, NULL, 110.00, 250),
    ('SN-1004', 5004, '2024-02-10', 120.00, 400),
    ('SN-1005', 5005, '2024-02-14', 45.00, 350),
    ('SN-1006', 5006, '2024-02-20', 60.00, 350),
    ('SN-1007', 5007, '2024-02-25', 90.00, 180),
    ('SN-1008', 5008, '2024-03-05', 130.00, 420),
    ('SN-1009', 5009, '2024-03-08', 2.00, 400),
    -- LeadTime 7 days  → due 2024-03-08
    ('SN-1010', 5010, '2024-04-09', 80.00, 280),
    -- LeadTime 30 days → due 2024-04-09
    ('SN-1011', 5011, '2024-03-28', 45.00, 350),
    -- LeadTime 10 days → due 2024-03-28
    ('SN-1012', 5012, '2024-04-23', 110.00, 210),
    -- LeadTime 21 days → due 2024-04-23
    ('SN-1013', 5013, '2024-04-29', 80.00, 450);
-- LeadTime 14 days → due 2024-04-29
-- 14. SHIPMENT 
INSERT INTO SHIPMENT (
        ShipmentID,
        OrderID,
        ExpectedDispatchDate,
        ActualDispatchDate,
        ExpectedArrivalDate,
        ActualArrivalDate,
        OriginalLocation,
        TrackingNum
    )
VALUES (
        7004,
        5004,
        '2024-01-28',
        NULL,
        '2024-02-10',
        NULL,
        'Shenzhen Port',
        'TRK5004A'
    ),
    (
        7005,
        5005,
        '2024-01-30',
        NULL,
        '2024-02-14',
        NULL,
        'Mumbai Port',
        'TRK5005A'
    ),
    (
        7006,
        5006,
        '2024-02-01',
        '2025-02-03',
        '2024-03-15',
        '2025-03-16',
        'Jakarta Port',
        'TRK5006A'
    ),
    (
        7007,
        5006,
        '2024-02-05',
        '2024-02-06',
        '2024-09-20',
        '2024-09-21',
        'Jakarta Port',
        'TRK5006B'
    ),
    (
        7008,
        5007,
        '2024-02-10',
        '2024-02-11',
        '2024-02-24',
        '2024-02-25',
        'Bangkok Depot',
        'TRK5007A'
    ),
    (
        7009,
        5008,
        '2024-02-15',
        '2024-05-16',
        '2024-05-01',
        '2024-12-02',
        'Busan Terminal',
        'TRK5008A'
    ),
    (
        7010,
        5008,
        '2024-02-18',
        '2024-02-19',
        '2024-03-04',
        '2024-03-05',
        'Busan Terminal',
        'TRK5008B'
    ),
    (
        7011,
        5009,
        '2024-03-03',
        '2024-07-03',
        '2024-05-08',
        '2024-12-08',
        'Los Angeles Port',
        'TRK5009A'
    ),
    (
        7012,
        5010,
        '2024-03-17',
        '2024-03-21',
        '2024-04-09',
        '2024-04-15',
        'Tokyo Port',
        'TRK5010A'
    ),
    (
        7013,
        5011,
        '2024-03-22',
        '2024-03-25',
        '2024-03-28',
        '2024-04-02',
        'Singapore Port',
        'TRK5011A'
    ),
    (
        7014,
        5012,
        '2024-04-07',
        '2024-04-10',
        '2024-04-23',
        '2024-11-01',
        'Hamburg Port',
        'TRK5012A'
    ),
    (
        7015,
        5012,
        '2024-04-10',
        '2024-04-13',
        '2024-04-26',
        '2024-10-30',
        'Hamburg Port',
        'TRK5012B'
    ),
    (
        7016,
        5013,
        '2024-04-20',
        '2024-05-25',
        '2024-04-29',
        '2024-11-11',
        'Shenzhen Port',
        'TRK5013A'
    );
INSERT INTO SHIPITEM (ItemSerial, ShipmentID, ShippedQty)
VALUES ('SN-1006', 7006, 200),
    ('SN-1006', 7007, 150),
    ('SN-1007', 7008, 180),
    ('SN-1008', 7009, 250),
    ('SN-1008', 7010, 170),
    ('SN-1009', 7011, 400),
    ('SN-1010', 7012, 280),
    ('SN-1011', 7013, 350),
    ('SN-1012', 7014, 120),
    ('SN-1012', 7015, 90),
    ('SN-1013', 7016, 450);
-- 16. STAFF & EMPLOYEE & DRIVER
INSERT INTO STAFF (StaffID, [Name], [Type], HireDate)
VALUES (1, 'John Doe', 'Warehouse', '2020-01-01'),
    (2, 'Jane Smith', 'Driver', '2021-05-12'),
    (3, 'Mike Ross', 'Warehouse', '2022-03-15'),
    (4, 'Rachel Zane', 'Driver', '2022-06-01'),
    (5, 'Harvey Specter', 'Warehouse', '2019-11-20'),
    (6, 'Donna Paulsen', 'Driver', '2020-08-14'),
    (7, 'Louis Litt', 'Warehouse', '2021-02-10'),
    (8, 'Jessica Pearson', 'Driver', '2018-04-05');
INSERT INTO EMPLOYEE (StaffID, Certification, WarehouseID)
VALUES (1, 'Forklift Operator', 1),
    (3, 'Hazmat', 2),
    (5, 'Safety Officer', 3),
    (7, 'Forklift Operator', 4);
INSERT INTO DRIVER (
        StaffID,
        LicenseNumber,
        LicenseExpiration,
        VehicleID
    )
VALUES (2, 'DL-9988', '2028-12-31', 101),
    (4, 'DL-7766', '2027-05-15', 102),
    (6, 'DL-5544', '2029-01-20', 103),
    (8, 'DL-3322', '2026-11-10', 104);
-- 17. STOP
INSERT INTO STOP ([Sequence], RouteID, ActArrTime, EstArrTime)
VALUES (
        1,
        201,
        '2024-02-16 10:15:00',
        '2024-02-16 10:00:00'
    ),
    (
        2,
        201,
        '2024-02-16 13:30:00',
        '2024-02-16 13:00:00'
    ),
    (
        1,
        202,
        '2024-02-21 09:05:00',
        '2024-02-21 09:00:00'
    ),
    (
        2,
        202,
        '2024-02-21 11:45:00',
        '2024-02-21 11:30:00'
    ),
    (
        1,
        203,
        '2024-02-25 08:50:00',
        '2024-02-25 09:00:00'
    ),
    (
        1,
        204,
        '2024-03-02 10:00:00',
        '2024-03-02 10:00:00'
    ),
    (
        2,
        204,
        '2024-03-02 14:20:00',
        '2024-03-02 14:00:00'
    ),
    (
        1,
        205,
        '2024-03-05 09:30:00',
        '2024-03-05 09:00:00'
    ),
    (
        1,
        206,
        '2024-03-08 11:00:00',
        '2024-03-08 11:00:00'
    ),
    (
        1,
        207,
        '2024-04-15 14:30:00',
        '2024-04-09 10:00:00'
    ),
    (
        2,
        207,
        '2024-04-15 17:00:00',
        '2024-04-09 13:00:00'
    ),
    (
        1,
        208,
        '2024-04-02 09:20:00',
        '2024-03-28 09:00:00'
    ),
    (
        1,
        209,
        '2024-05-01 08:45:00',
        '2024-04-23 09:00:00'
    ),
    (
        2,
        209,
        '2024-05-01 12:00:00',
        '2024-04-23 12:00:00'
    ),
    (
        1,
        210,
        '2024-04-30 10:15:00',
        '2024-04-26 10:00:00'
    ),
    (
        1,
        211,
        '2024-05-06 13:00:00',
        '2024-04-29 10:00:00'
    ),
    (
        2,
        211,
        '2024-05-06 16:30:00',
        '2024-04-29 13:00:00'
    );
-- 18. DELIVERY (Added deliveries for shipments 7009-7015)
INSERT INTO DELIVERY (
        [Date],
        WarehouseID,
        VehicleID,
        ShipmentID,
        RouteID
    )
VALUES ('2024-02-16', 7, 101, 7006, 201),
    ('2024-02-21', 7, 102, 7007, 202),
    ('2024-02-25', 7, 103, 7008, 203),
    ('2024-03-02', 8, 101, 7009, 204),
    ('2024-03-05', 8, 102, 7010, 205),
    ('2024-03-08', 2, 103, 7011, 206),
    ('2024-04-15', 1, 101, 7012, 207),
    ('2024-04-02', 1, 102, 7013, 208),
    ('2024-05-01', 6, 103, 7014, 209),
    ('2024-04-30', 6, 104, 7015, 210),
    ('2024-05-06', 4, 101, 7016, 211);
-- 19. SUPPLIER_HAS_PURCHASEORDER
INSERT INTO SUPPLIER_HAS_PURCHASEORDER (OrderID, SupplierID)
VALUES (5001, 1),
    (5002, 2),
    (5003, 3),
    (5004, 1),
    (5005, 7),
    (5006, 4),
    (5007, 4),
    (5008, 6),
    (5009, 2),
    (5010, 6),
    (5011, 5),
    (5012, 3),
    (5013, 1);
-- 20. SHIPMENT_HAS_SUPPLIER
INSERT INTO SHIPMENT_HAS_SUPPLIER (ShipmentID, SupplierID)
VALUES (7004, 1),
    (7005, 7),
    (7006, 4),
    (7007, 4),
    (7008, 4),
    (7009, 6),
    (7010, 6),
    (7011, 2),
    (7012, 6),
    (7013, 5),
    (7014, 3),
    (7015, 3),
    (7016, 1);
-- 21. SHIPMENT_TO_WAREHOUSE
INSERT INTO SHIPMENT_TO_WAREHOUSE (ShipmentID, WarehouseID)
VALUES (7004, 1),
    (7005, 2),
    (7006, 7),
    (7007, 7),
    (7008, 7),
    (7009, 8),
    (7010, 8),
    (7011, 2),
    (7012, 1),
    (7013, 1),
    (7014, 6),
    (7015, 6),
    (7016, 4);
-- -- 1. WAREHOUSE
-- INSERT INTO WAREHOUSE (
--         WarehouseID,
--         [Address],
--         [Size],
--         Temperature,
--         Security
--     )
-- VALUES (
--         1,
--         '123 Changi North, Singapore',
--         '50000 sqft',
--         'Ambient',
--         'High'
--     ),
--     (
--         2,
--         '45 Tuas South, Singapore',
--         '30000 sqft',
--         'Refrigerated',
--         'Medium'
--     ),
--     (
--         3,
--         '88 Jurong Island, Singapore',
--         '20000 sqft',
--         'Frozen',
--         'High'
--     ),
--     (
--         4,
--         '12 Sunset Blvd, Los Angeles, USA',
--         '100000 sqft',
--         'Ambient',
--         'High'
--     ),
--     (
--         5,
--         '55 Hollywood Way, Los Angeles, USA',
--         '75000 sqft',
--         'Ambient',
--         'Medium'
--     ),
--     (
--         6,
--         '99 Alpine Rd, Zurich',
--         '15000 sqft',
--         'Refrigerated',
--         'High'
--     ),
--     (
--         7,
--         '101 Bangkok Central, Thailand',
--         '60000 sqft',
--         'Ambient',
--         'High'
--     ),
--     (
--         8,
--         '22 Sakura Ln, Tokyo',
--         '40000 sqft',
--         'Ambient',
--         'Medium'
--     );
-- -- 2. ZONE
-- INSERT INTO ZONE (WarehouseID, ZoneType)
-- VALUES (1, 'Receiving'),
--     (1, 'Bulk Storage'),
--     (2, 'Picking'),
--     (3, 'Shipping Dock'),
--     (4, 'Packing'),
--     (5, 'Receiving'),
--     (6, 'Bulk Storage'),
--     (7, 'Hazardous');
-- -- 3. LOCATION
-- INSERT INTO LOCATION (LocationCode, WarehouseID, ZoneType)
-- VALUES ('A-01', 1, 'Receiving'),
--     ('B-05', 1, 'Bulk Storage'),
--     ('C-10', 2, 'Picking'),
--     ('D-02', 3, 'Shipping Dock'),
--     ('E-11', 4, 'Packing'),
--     ('F-09', 5, 'Receiving'),
--     ('G-03', 6, 'Bulk Storage'),
--     ('H-07', 7, 'Hazardous');
-- -- 4. CLIENT
-- INSERT INTO CLIENT (
--         ClientID,
--         ServiceTier,
--         CompanyName,
--         StartDate,
--         ContactPerson
--     )
-- VALUES (
--         1,
--         'Platinum',
--         'TechGiant Corp',
--         '2023-01-15',
--         'Alice Tan'
--     ),
--     (
--         2,
--         'Gold',
--         'FreshFoods Ltd',
--         '2023-03-20',
--         'Bob Miller'
--     ),
--     (
--         3,
--         'Silver',
--         'AutoParts Inc',
--         '2023-06-10',
--         'Charlie Day'
--     ),
--     (
--         4,
--         'Bronze',
--         'RetailWorks',
--         '2023-08-01',
--         'Diana Prince'
--     ),
--     (
--         5,
--         'Platinum',
--         'Global Pharma',
--         '2022-11-12',
--         'Edward Norton'
--     ),
--     (
--         6,
--         'Silver',
--         'EcoBuild',
--         '2024-01-05',
--         'Fiona Gallagher'
--     ),
--     (
--         7,
--         'Gold',
--         'SkyHigh Electronics',
--         '2023-05-22',
--         'George Bluth'
--     ),
--     (
--         8,
--         'Platinum',
--         'Luxury Goods Co',
--         '2023-09-30',
--         'Hannah Abbott'
--     );
-- -- 5. PRODUCT
-- INSERT INTO PRODUCT (ProductID, [Name], Brand, Cost, Category, Price)
-- VALUES (
--         101,
--         'Smartphone X',
--         'TechBrand',
--         400.00,
--         'Electronics',
--         899.00
--     ),
--     (
--         102,
--         'Frozen Peas',
--         'GreenFarm',
--         1.50,
--         'Food',
--         3.50
--     ),
--     (
--         103,
--         'Brake Pads',
--         'FastStop',
--         45.00,
--         'Automotive',
--         120.00
--     ),
--     (
--         104,
--         'Cotton T-Shirt',
--         'BasicWear',
--         5.00,
--         'Apparel',
--         19.99
--     ),
--     (
--         105,
--         'Insulin Vials',
--         'MediCure',
--         50.00,
--         'Pharma',
--         150.00
--     ),
--     (
--         106,
--         'Solar Panel',
--         'SunPower',
--         200.00,
--         'Energy',
--         450.00
--     ),
--     (
--         107,
--         'Organic Milk',
--         'DairyPure',
--         2.00,
--         'Food',
--         4.50
--     ),
--     (
--         108,
--         'Leather Bag',
--         'Luxe',
--         300.00,
--         'Luxury',
--         1200.00
--     );
-- -- 6. INVENTORY
-- INSERT INTO INVENTORY (
--         InventorySerial,
--         WarehouseID,
--         ProductID,
--         ClientID,
--         RQty,
--         HQty,
--         SQty,
--         OQty,
--         [Location]
--     )
-- VALUES (1001, 1, 101, 1, 10, 100, 90, 200, 'LOC-01'),
--     (1002, 1, 102, 2, 10, 100, 90, 200, 'LOC-02'),
--     (1003, 1, 103, 3, 10, 100, 90, 200, 'LOC-03'),
--     (1004, 4, 101, 1, 10, 100, 90, 200, 'LOC-04'),
--     (1005, 4, 104, 4, 10, 100, 90, 200, 'LOC-05'),
--     (1006, 7, 106, 6, 10, 100, 90, 200, 'LOC-06'),
--     (1007, 2, 107, 2, 10, 100, 90, 200, 'LOC-07'),
--     (1008, 3, 108, 8, 10, 100, 90, 200, 'LOC-08');
-- -- 7. INVENTORY_LOG
-- INSERT INTO INVENTORY_LOG (
--         InventorySerial,
--         WarehouseID,
--         ProductID,
--         ClientID,
--         [Timestamp],
--         Movement,
--         Reason
--     )
-- VALUES (
--         1001,
--         1,
--         101,
--         1,
--         '2026-03-01 09:00:00',
--         'Receipt',
--         'New Stock Arrival'
--     ),
--     (
--         1002,
--         1,
--         102,
--         2,
--         '2026-03-02 10:30:00',
--         'Pick',
--         'Order Fulfillment'
--     ),
--     (
--         1003,
--         1,
--         103,
--         3,
--         '2026-03-03 14:15:00',
--         'Adjustment',
--         'Damage Discovery'
--     ),
--     (
--         1004,
--         4,
--         101,
--         1,
--         '2026-03-04 08:45:00',
--         'Putaway',
--         'Dock to Shelf'
--     ),
--     (
--         1005,
--         4,
--         104,
--         4,
--         '2026-03-05 11:00:00',
--         'Receipt',
--         'Supplier Delivery'
--     ),
--     (
--         1006,
--         7,
--         106,
--         6,
--         '2026-03-06 16:20:00',
--         'Pick',
--         'Outbound Shipment'
--     ),
--     (
--         1007,
--         2,
--         107,
--         2,
--         '2026-03-07 07:10:00',
--         'Adjustment',
--         'Cycle Count'
--     ),
--     (
--         1008,
--         3,
--         108,
--         8,
--         '2026-03-08 13:00:00',
--         'Receipt',
--         'Restock'
--     );
-- -- 8. SUPPLIER
-- INSERT INTO SUPPLIER (SupplierID, Country, [Name], PaymentTerms)
-- VALUES (1, 'China', 'SG-Only Supplier', 'Net 30'),
--     -- Designed for Q5
--     (2, 'USA', 'Global Supply Co', 'Net 15'),
--     (3, 'Germany', 'EuroParts', 'COD'),
--     (4, 'Thailand', 'Thai Logistics', 'Net 30'),
--     (5, 'Singapore', 'Merlion Mfg', 'Net 30'),
--     (6, 'Japan', 'Nippon Export', 'Net 30'),
--     (7, 'India', 'Bharat Tech', 'Net 45'),
--     (8, 'Italy', 'Venezia Goods', 'Net 30');
-- -- 9. SUPPLY
-- INSERT INTO SUPPLY (
--         [Period],
--         ProductID,
--         ClientID,
--         SupplierID,
--         LeadTime
--     )
-- VALUES ('2026-Q1', 101, 1, 1, 14),
--     ('2026-Q1', 102, 2, 2, 7),
--     ('2026-Q1', 103, 3, 3, 21),
--     ('2026-Q1', 104, 4, 4, 30),
--     ('2026-Q1', 105, 5, 5, 10),
--     ('2026-Q1', 106, 6, 6, 25),
--     ('2026-Q1', 107, 2, 2, 5),
--     ('2026-Q1', 108, 8, 8, 45);
-- --- 10. PURCHASEORDER
-- INSERT INTO PURCHASEORDER (OrderID, OrderDate, [Status], [Value])
-- VALUES (5001, '2024-05-10', 'Fully Received', 100000.00),
--     (5002, '2024-05-15', 'Fully Received', 150000.00),
--     (5003, '2024-06-20', 'Fully Received', 80000.00),
--     (5004, '2025-11-01', 'Fully Received', 50000.00),
--     (5005, '2025-11-15', 'Fully Received', 90000.00),
--     (5006, '2025-12-05', 'Fully Received', 120000.00),
--     (5007, '2026-01-10', 'Submitted', 200000.00),
--     (5008, '2026-01-20', 'Submitted', 300000.00),
--     --newly added
--     (5009, '2025-11-20', 'Fully Received', 45000.00),
--     (5010, '2025-11-25', 'Fully Received', 60000.00),
--     (5011, '2026-01-28', 'Submitted', 150000.00);
-- -- 11. CLIENT_HAS_PURCHASEORDER
-- INSERT INTO CLIENT_HAS_PURCHASEORDER (ClientID, OrderID)
-- VALUES (1, 5001),
--     (2, 5002),
--     (3, 5003),
--     (4, 5004),
--     (1, 5005),
--     (6, 5006),
--     (2, 5007),
--     (8, 5008),
--     (3, 5009),
--     (5, 5010),
--     (7, 5011);
-- -- 12. ITEM (Added SN-1009 to SN-1015)
-- INSERT INTO ITEM (ItemSerial, ProductID)
-- VALUES ('SN-1001', 101),
--     ('SN-1002', 102),
--     ('SN-1003', 103),
--     ('SN-1004', 104),
--     ('SN-1005', 105),
--     ('SN-1006', 106),
--     ('SN-1007', 107),
--     ('SN-1008', 108),
--     ('SN-1009', 101),
--     ('SN-1010', 102),
--     ('SN-1011', 103),
--     ('SN-1012', 104),
--     ('SN-1013', 105),
--     ('SN-1014', 106),
--     ('SN-1015', 107);
-- -- 13. ORDERITEM (Mapping the new items to the orders)
-- INSERT INTO ORDERITEM (
--         ItemSerial,
--         OrderID,
--         ExpDelDate,
--         UnitPrice,
--         OrderedQty
--     )
-- VALUES ('SN-1001', 5001, '2026-02-15', 400.00, 100),
--     ('SN-1002', 5002, '2026-02-12', 1.50, 8000),
--     ('SN-1003', 5003, '2026-03-01', 45.00, 180),
--     ('SN-1004', 5004, '2026-03-15', 5.00, 600),
--     ('SN-1005', 5005, '2026-03-10', 50.00, 1200),
--     ('SN-1006', 5006, '2026-04-01', 200.00, 10),
--     ('SN-1007', 5007, '2026-03-20', 2.00, 12500),
--     ('SN-1008', 5008, '2026-04-10', 300.00, 180),
--     ('SN-1009', 5009, '2024-08-20', 400.00, 50),
--     ('SN-1010', 5010, '2025-03-10', 1.50, 4000),
--     ('SN-1011', 5011, '2025-08-01', 45.00, 90),
--     ('SN-1012', 5012, '2026-02-25', 5.00, 300),
--     ('SN-1013', 5013, '2024-11-10', 50.00, 600),
--     ('SN-1014', 5014, '2025-06-25', 200.00, 5),
--     ('SN-1015', 5015, '2025-11-15', 2.00, 6000);
-- -- 14. SHIPMENT (15 Rows total: Mixed Late and Non-Late, ordered by ShipmentID)
-- INSERT INTO SHIPMENT (
--         ShipmentID,
--         ExpectedDispatchDate,
--         ActualDispatchDate,
--         OriginalLocation,
--         TrackingNum,
--         ExpectedArrivalDate,
--         ActualArrivalDate,
--         OrderID
--     )
-- VALUES (
--         7001,
--         '2024-05-11',
--         '2024-05-11',
--         'China Port',
--         'TRK001',
--         '2024-05-25',
--         '2024-05-25',
--         5001
--     ),
--     (
--         7002,
--         '2024-05-16',
--         '2024-06-10',
--         'Suez Canal',
--         'TRK002',
--         '2024-06-06',
--         '2024-07-20',
--         5002
--     ),
--     (
--         7003,
--         '2024-06-21',
--         '2026-06-22',
--         'Hamburg',
--         'TRK003',
--         '2024-06-30',
--         '2026-07-10',
--         5003
--     ),
--     (
--         7004,
--         '2025-11-02',
--         '2026-11-03',
--         'Vietnam',
--         'TRK004',
--         '2025-11-18',
--         '2026-11-20',
--         5004
--     ),
--     (
--         7005,
--         '2025-11-16',
--         '2025-12-20',
--         'Panama',
--         'TRK005',
--         '2026-01-20',
--         '2026-02-02',
--         5005
--     ),
--     (
--         7006,
--         '2025-12-06',
--         '2025-12-06',
--         'Kyoto',
--         'TRK006',
--         '2025-12-15',
--         '2026-01-05',
--         5006
--     ),
--     (
--         7007,
--         '2026-01-11',
--         '2026-02-15',
--         'Mumbai',
--         'TRK007',
--         '2026-02-01',
--         '2026-08-25',
--         5007
--     ),
--     (
--         7008,
--         '2026-01-21',
--         '2026-01-21',
--         'Milan',
--         'TRK008',
--         '2026-02-10',
--         '2026-03-10',
--         5008
--     ),
--     (
--         7009,
--         '2024-08-10',
--         '2024-08-10',
--         'Singapore',
--         'TRK009',
--         '2024-08-15',
--         '2024-08-20',
--         5001
--     ),
--     (
--         7010,
--         '2025-02-15',
--         '2025-02-16',
--         'Tokyo',
--         'TRK010',
--         '2025-04-05',
--         '2025-04-20',
--         5002
--     ),
--     (
--         7011,
--         '2025-07-01',
--         '2025-07-02',
--         'Shanghai',
--         'TRK011',
--         '2025-07-28',
--         '2025-08-21',
--         5003
--     ),
--     (
--         7012,
--         '2026-02-05',
--         '2026-02-05',
--         'Dubai',
--         'TRK012',
--         '2026-02-20',
--         '2026-03-10',
--         5004
--     ),
--     (
--         7013,
--         '2024-09-01',
--         '2024-09-20',
--         'Los Angeles',
--         'TRK013',
--         '2024-11-05',
--         '2024-11-20',
--         5005
--     ),
--     (
--         7014,
--         '2025-04-10',
--         '2025-06-15',
--         'London',
--         'TRK014',
--         '2025-06-20',
--         '2025-12-20',
--         5006
--     ),
--     (
--         7015,
--         '2025-08-20',
--         '2026-06-01',
--         'Sydney',
--         'TRK015',
--         '2025-11-10',
--         '2026-06-22',
--         5007
--     );
-- -- 82 days late (Late)
-- -- 14. SHIPMENT (15 Rows total: Mixed Late and Non-Late, ordered by ShipmentID)
-- -- INSERT INTO SHIPMENT (
-- --         ShipmentID,
-- --         ExpShippedDate,
-- --         ActShippedDate,
-- --         OriginalLocation,
-- --         TrackingNum,
-- --         ActArrivalDate,
-- --         OrderID
-- --     )
-- -- VALUES (
-- --         7001,
-- --         '2024-05-11',
-- --         '2024-05-11',
-- --         'China Port',
-- --         'TRK001',
-- --         '2024-05-25',
-- --         5001
-- --     ),
-- --     -- 14 days (Non-late)
-- --     (
-- --         7002,
-- --         '2024-05-16',
-- --         '2024-06-10',
-- --         'Suez Canal',
-- --         'TRK002',
-- --         '2024-07-20',
-- --         5002
-- --     ),
-- --     -- 65 days late (Late)
-- --     (
-- --         7003,
-- --         '2024-06-21',
-- --         '2024-06-22',
-- --         'Hamburg',
-- --         'TRK003',
-- --         '2024-07-10',
-- --         5003
-- --     ),
-- --     -- 19 days (Non-late)
-- --     (
-- --         7004,
-- --         '2025-11-02',
-- --         '2025-11-03',
-- --         'Vietnam',
-- --         'TRK004',
-- --         '2025-11-20',
-- --         5004
-- --     ),
-- --     -- 18 days (Non-late)
-- --     (
-- --         7005,
-- --         '2025-11-16',
-- --         '2025-12-20',
-- --         'Panama',
-- --         'TRK005',
-- --         '2026-01-25',
-- --         5005
-- --     ),
-- --     -- 70 days late (Late)
-- --     (
-- --         7006,
-- --         '2025-12-06',
-- --         '2025-12-06',
-- --         'Kyoto',
-- --         'TRK006',
-- --         '2025-12-15',
-- --         5006
-- --     ),
-- --     -- 9 days (Non-late)
-- --     (
-- --         7007,
-- --         '2026-01-11',
-- --         '2026-02-15',
-- --         'Mumbai',
-- --         'TRK007',
-- --         '2026-03-01',
-- --         5007
-- --     ),
-- --     -- 49 days late (Late)
-- --     (
-- --         7008,
-- --         '2026-01-21',
-- --         '2026-01-21',
-- --         'Milan',
-- --         'TRK008',
-- --         '2026-02-10',
-- --         5008
-- --     ),
-- --     -- 20 days (Non-late)
-- --     (
-- --         7009,
-- --         '2024-08-10',
-- --         '2024-08-10',
-- --         'Singapore',
-- --         'TRK009',
-- --         '2024-08-15',
-- --         5001
-- --     ),
-- --     -- 5 days (Non-late)
-- --     (
-- --         7010,
-- --         '2025-02-15',
-- --         '2025-02-16',
-- --         'Tokyo',
-- --         'TRK010',
-- --         '2025-03-05',
-- --         5002
-- --     ),
-- --     -- 18 days (Non-late)
-- --     (
-- --         7011,
-- --         '2025-07-01',
-- --         '2025-07-02',
-- --         'Shanghai',
-- --         'TRK011',
-- --         '2025-07-28',
-- --         5003
-- --     ),
-- --     -- 27 days (Non-late)
-- --     (
-- --         7012,
-- --         '2026-02-05',
-- --         '2026-02-05',
-- --         'Dubai',
-- --         'TRK012',
-- --         '2026-02-20',
-- --         5004
-- --     ),
-- --     -- 15 days (Non-late)
-- --     (
-- --         7013,
-- --         '2024-09-01',
-- --         '2024-09-20',
-- --         'Los Angeles',
-- --         'TRK013',
-- --         '2024-11-05',
-- --         5005
-- --     ),
-- --     -- 65 days late (Late)
-- --     (
-- --         7014,
-- --         '2025-04-10',
-- --         '2025-05-15',
-- --         'London',
-- --         'TRK014',
-- --         '2025-06-20',
-- --         5006
-- --     ),
-- --     -- 71 days late (Late)
-- --     (
-- --         7015,
-- --         '2025-08-20',
-- --         '2025-10-01',
-- --         'Sydney',
-- --         'TRK015',
-- --         '2025-11-10',
-- --         5007
-- --     );
-- -- 82 days late (Late)
-- -- 15. SHIPITEM (Putting the items inside the 15 shipments)
-- INSERT INTO SHIPITEM (ItemSerial, ShipmentID, ShippedQty, ExpArrDate)
-- VALUES ('SN-1001', 7001, 100, '2026-02-16'),
--     ('SN-1002', 7002, 8000, '2026-02-13'),
--     ('SN-1003', 7003, 180, '2026-03-05'),
--     ('SN-1004', 7004, 600, '2026-03-20'),
--     ('SN-1005', 7005, 1200, '2026-03-15'),
--     ('SN-1006', 7006, 10, '2026-04-10'),
--     ('SN-1007', 7007, 12500, '2026-03-25'),
--     ('SN-1008', 7008, 180, '2026-04-20'),
--     ('SN-1009', 7009, 50, '2024-08-15'),
--     ('SN-1010', 7010, 4000, '2025-03-05'),
--     ('SN-1011', 7011, 90, '2025-07-28'),
--     ('SN-1012', 7012, 300, '2026-02-20'),
--     ('SN-1013', 7013, 600, '2024-11-05'),
--     ('SN-1014', 7014, 5, '2025-06-20'),
--     ('SN-1015', 7015, 6000, '2025-11-10');
-- -- 16. STAFF & EMPLOYEE & DRIVER
-- INSERT INTO STAFF (StaffID, [Name], [Type], HireDate)
-- VALUES (1, 'John Doe', 'Warehouse', '2020-01-01'),
--     (2, 'Jane Smith', 'Driver', '2021-05-12'),
--     (3, 'Mike Ross', 'Warehouse', '2022-03-15'),
--     (4, 'Rachel Zane', 'Driver', '2022-06-01'),
--     (5, 'Harvey Specter', 'Warehouse', '2019-11-20'),
--     (6, 'Donna Paulsen', 'Driver', '2020-08-14'),
--     (7, 'Louis Litt', 'Warehouse', '2021-02-10'),
--     (8, 'Jessica Pearson', 'Driver', '2018-04-05');
-- INSERT INTO EMPLOYEE (StaffID, Certification, WarehouseID)
-- VALUES (1, 'Forklift Operator', 1),
--     (3, 'Hazmat', 2),
--     (5, 'Safety Officer', 3),
--     (7, 'Forklift Operator', 4);
-- INSERT INTO DRIVER (
--         StaffID,
--         LicenseNumber,
--         LicenseExpiration,
--         VehicleID
--     )
-- VALUES (2, 'DL-9988', '2028-12-31', 101),
--     (4, 'DL-7766', '2027-05-15', 102),
--     (6, 'DL-5544', '2029-01-20', 103),
--     (8, 'DL-3322', '2026-11-10', 104);
-- -- 17. STOP
-- INSERT INTO STOP ([Sequence], RouteID, ActArrTime, EstArrTime)
-- VALUES (
--         1,
--         101,
--         '2026-03-20 09:00:00',
--         '2026-03-20 08:45:00'
--     ),
--     (
--         2,
--         101,
--         '2026-03-20 11:30:00',
--         '2026-03-20 11:00:00'
--     ),
--     (
--         1,
--         102,
--         '2026-03-20 08:30:00',
--         '2026-03-20 08:30:00'
--     ),
--     (2, 102, NULL, '2026-03-20 14:00:00'),
--     (
--         1,
--         103,
--         '2026-03-20 10:00:00',
--         '2026-03-20 10:00:00'
--     ),
--     (
--         1,
--         104,
--         '2026-03-21 09:00:00',
--         '2026-03-21 09:00:00'
--     ),
--     (1, 105, NULL, '2026-03-21 13:00:00'),
--     (1, 106, NULL, '2026-03-22 08:00:00');
-- -- 18. DELIVERY (Added deliveries for shipments 7009-7015)
-- INSERT INTO DELIVERY (
--         [Date],
--         WarehouseID,
--         VehicleID,
--         ShipmentID,
--         RouteID
--     )
-- VALUES ('2026-03-20', 1, 101, 7001, 101),
--     ('2026-03-20', 2, 102, 7002, 102),
--     ('2026-03-20', 3, 103, 7003, 103),
--     ('2026-03-21', 4, 104, 7004, 104),
--     ('2026-03-21', 5, 105, 7005, 105),
--     ('2026-03-22', 6, 106, 7006, 106),
--     ('2026-03-23', 7, 107, 7007, 107),
--     ('2026-03-24', 8, 108, 7008, 108),
--     ('2024-08-15', 1, 101, 7009, 101),
--     ('2025-03-05', 2, 102, 7010, 102),
--     ('2025-07-28', 3, 103, 7011, 103),
--     ('2026-02-20', 4, 104, 7012, 104),
--     ('2024-11-05', 5, 101, 7013, 105),
--     ('2025-06-20', 6, 102, 7014, 106),
--     ('2025-11-10', 7, 103, 7015, 107);
-- -- 19. SUPPLIER_HAS_PURCHASEORDER
-- INSERT INTO SUPPLIER_HAS_PURCHASEORDER (OrderID, SupplierID)
-- VALUES (5001, 1),
--     (5002, 2),
--     (5003, 3),
--     (5004, 4),
--     (5005, 5),
--     (5006, 6),
--     (5007, 2),
--     (5008, 8),
--     (5009, 3),
--     (5010, 5),
--     (5011, 7);
-- -- 20. SHIPMENT_HAS_SUPPLIER
-- INSERT INTO SHIPMENT_HAS_SUPPLIER (ShipmentID, SupplierID)
-- VALUES (7001, 1),
--     (7002, 1),
--     (7003, 2),
--     (7004, 2),
--     (7005, 1),
--     (7006, 4),
--     (7007, 1),
--     (7008, 1),
--     (7009, 5),
--     (7010, 6),
--     (7011, 1),
--     (7012, 3),
--     (7013, 2),
--     (7014, 8),
--     (7015, 4);
-- -- 21. SHIPMENT_TO_WAREHOUSE
-- INSERT INTO SHIPMENT_TO_WAREHOUSE (ShipmentID, WarehouseID)
-- VALUES (7001, 1),
--     (7002, 1),
--     (7003, 4),
--     (7004, 4),
--     (7005, 1),
--     (7006, 7),
--     (7007, 2),
--     (7008, 3),
--     (7009, 1),
--     (7010, 8),
--     (7011, 1),
--     (7012, 6),
--     (7013, 5),
--     (7014, 6),
--     (7015, 2);