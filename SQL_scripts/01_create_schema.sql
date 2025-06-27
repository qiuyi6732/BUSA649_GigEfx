CREATE TABLE IF NOT EXISTS ItemCategory (
    Id INT PRIMARY KEY,
    Category VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Stores (
    StoreId INT PRIMARY KEY,
    StoreName VARCHAR(255),
    Address VARCHAR(255),
    Country VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    PhoneNumber VARCHAR(50),
    WebsiteAddress VARCHAR(255),
    DeliveryAvailability BOOLEAN,
    OpenSince INT
);

CREATE TABLE IF NOT EXISTS Items (
    ItemId INT PRIMARY KEY,
    ItemName VARCHAR(255),
    Brand VARCHAR(100),
    CategoryId INT,
    Rating FLOAT,
    FOREIGN KEY (CategoryId) REFERENCES ItemCategory(Id)
);

CREATE TABLE IF NOT EXISTS StoreInventory (
    InventoryId INT PRIMARY KEY,
    Date DATE,
    StoreId INT,
    ItemId INT,
    AmountInStock INT,
    FOREIGN KEY (StoreId) REFERENCES Stores(StoreId),
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId)
);

CREATE TABLE IF NOT EXISTS Prices (
    PriceId INT PRIMARY KEY,
    Date DATE,
    UnitPrice FLOAT,
    Currency VARCHAR(10),
    DiscountRate FLOAT,
    IsPromotion BOOLEAN,
    ItemId INT,
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId)
);

CREATE TABLE IF NOT EXISTS Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(255),
    Address VARCHAR(255),
    Country VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    PhoneNumber VARCHAR(50),
    Email VARCHAR(255),
    CreatedAt DATE
);

CREATE TABLE IF NOT EXISTS StoreDeliveryAreas (
    Id INT PRIMARY KEY,
    StoreId INT,
    AreaName VARCHAR(255),
    PostalCode VARCHAR(20),
    DeliveryFee FLOAT,
    EstimatedTime VARCHAR(50),
    FOREIGN KEY (StoreId) REFERENCES Stores(StoreId)
);

CREATE TABLE IF NOT EXISTS UserRatings (
    RatingId INT PRIMARY KEY,
    UserId INT,
    Date DATE,
    ItemId INT,
    Rating FLOAT,
    Comment TEXT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId)
);