CREATE DATABASE  REAL_STATE_MANAGEMENT_SYSTEM;
USE REAL_STATE_MANAGEMENT_SYSTEM;
CREATE TABLE Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    Type VARCHAR(50),
    Price DECIMAL(10, 2),
    Bedrooms INT,
    Bathrooms INT,
    Area FLOAT,
    Description TEXT
);
CREATE TABLE Agents (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(255),
    CommissionRate DECIMAL(5, 2)
);
CREATE TABLE Buyers (
    BuyerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(255),
    Budget DECIMAL(10, 2)
);
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    BuyerID INT,
    AgentID INT,
    Date DATE,
    Price DECIMAL(10, 2)
);
CREATE TABLE PropertyImages (
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    ImageURL VARCHAR(255)
);
CREATE TABLE Visits (
    VisitID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    VisitorName VARCHAR(100),
    VisitDate DATE
);
CREATE TABLE PropertyFeatures (
    FeatureID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    FeatureDescription TEXT
);
CREATE TABLE PropertyTypes (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50)
);
CREATE TABLE PropertyTypeMapping (
    PropertyID INT,
    TypeID INT
);
CREATE TABLE PropertyStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50)
);