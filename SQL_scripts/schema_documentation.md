
# GigEfx Database Schema Documentation

## Tables and Key Fields

### 1. ItemCategory
- `Id` (INT, Primary Key)
- `Category` (VARCHAR)

### 2. Items
- `ItemId` (INT, Primary Key)
- `ItemName` (VARCHAR)
- `Brand` (VARCHAR)
- `CategoryId` (INT, Foreign Key → ItemCategory.Id)
- `Rating` (FLOAT)

### 3. Stores
- `StoreId` (INT, Primary Key)
- `StoreName`, `Address`, `Country`, `Latitude`, `Longitude`
- `PhoneNumber`, `WebsiteAddress`, `DeliveryAvailability`, `OpenSince`

### 4. StoreInventory
- `InventoryId` (INT, Primary Key)
- `Date`, `StoreId` (FK → Stores), `ItemId` (FK → Items), `AmountInStock`

### 5. Prices
- `PriceId` (INT, Primary Key)
- `Date`, `UnitPrice`, `Currency`, `DiscountRate`, `IsPromotion`, `ItemId` (FK)

### 6. Users
- `UserId` (INT, Primary Key)
- `UserName`, `Address`, `Country`, `Latitude`, `Longitude`, `PhoneNumber`, `Email`, `CreatedAt`

### 7. StoreDeliveryAreas
- `Id` (INT, Primary Key)
- `StoreId` (FK → Stores), `AreaName`, `PostalCode`, `DeliveryFee`, `EstimatedTime`

### 8. UserRatings
- `RatingId` (INT, Primary Key)
- `UserId` (FK → Users), `ItemId` (FK → Items), `Date`, `Rating`, `Comment`
