
-- Insert sample data into ItemCategory
INSERT INTO ItemCategory (Id, Category) VALUES
(1, 'Smartphones'),
(2, 'Tablets');

-- Insert sample data into Stores
INSERT INTO Stores (StoreId, StoreName, Address, Country, Latitude, Longitude, PhoneNumber, WebsiteAddress, DeliveryAvailability, OpenSince) VALUES
(101, 'TechWorld Cape Town', '123 Main St', 'South Africa', -33.9249, 18.4241, '021-555-1234', 'https://techworld.co.za', TRUE, 2018);

-- Insert sample data into Items
INSERT INTO Items (ItemId, ItemName, Brand, CategoryId, Rating) VALUES
(201, 'iPhone 13', 'Apple', 1, 4.7),
(202, 'Galaxy S22', 'Samsung', 1, 4.5);

-- Insert sample data into StoreInventory
INSERT INTO StoreInventory (InventoryId, Date, StoreId, ItemId, AmountInStock) VALUES
(301, '2024-06-01', 101, 201, 12),
(302, '2024-06-01', 101, 202, 8);

-- Insert sample data into Prices
INSERT INTO Prices (PriceId, Date, UnitPrice, Currency, DiscountRate, IsPromotion, ItemId) VALUES
(401, '2024-06-01', 15999.99, 'ZAR', 0.10, TRUE, 201),
(402, '2024-06-01', 13999.99, 'ZAR', 0.15, TRUE, 202);

-- Insert sample data into Users
INSERT INTO Users (UserId, UserName, Address, Country, Latitude, Longitude, PhoneNumber, Email, CreatedAt) VALUES
(501, 'Lindiwe Nkosi', '456 Oak Avenue', 'South Africa', -26.2041, 28.0473, '011-555-6789', 'lindiwe@example.com', '2023-01-15');

-- Insert sample data into StoreDeliveryAreas
INSERT INTO StoreDeliveryAreas (Id, StoreId, AreaName, PostalCode, DeliveryFee, EstimatedTime) VALUES
(601, 101, 'Cape Town Central', '8001', 30.00, '2 hours');

-- Insert sample data into UserRatings
INSERT INTO UserRatings (RatingId, UserId, Date, ItemId, Rating, Comment) VALUES
(701, 501, '2024-06-05', 201, 4.8, 'Excellent phone with great battery life'),
(702, 501, '2024-06-06', 202, 4.6, 'Very good camera and screen');