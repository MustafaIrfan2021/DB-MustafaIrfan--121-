CREATE DATABASE REALSTATEMANAGEMENTSYSTEM;
USE REALSTATEMANAGEMENTSYSTEM;

-- Table: agents
CREATE TABLE agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_name VARCHAR(255) NOT NULL,
    agent_email VARCHAR(255) UNIQUE NOT NULL,
    agent_phone VARCHAR(20) NOT NULL,
    agent_address VARCHAR(255),
    agent_license_number VARCHAR(50) UNIQUE NOT NULL,
    agent_commission_rate DECIMAL(4,2) DEFAULT 0.05
);

-- Inserting some sample data Agents
INSERT INTO agents (agent_name, agent_email, agent_phone, agent_license_number) VALUES 
('Mustafairfan', 'mustafairfan@email.com', '555-123-4567', '1234567'),
('Saeedsheikh', 'saeedsheikh@email.com', '555-987-6543', '8765432');

-- Table: properties
CREATE TABLE properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    property_address VARCHAR(255) NOT NULL,
    property_type VARCHAR(50) NOT NULL,
    property_status VARCHAR(50) DEFAULT 'Available',
    property_description TEXT,
    property_price DECIMAL(10,2) NOT NULL,
    property_bedrooms INT,
    property_bathrooms INT,
    property_sqft INT,
    property_lot_size DECIMAL(10,2),
    property_year_built INT,
    property_image_url VARCHAR(255),
    property_latitude DECIMAL(10,6),
    property_longitude DECIMAL(10,6),
    property_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    property_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Properties
INSERT INTO properties (property_address, property_type, property_price, property_bedrooms, property_bathrooms) VALUES
('123 Main Street', 'Single Family', 250000, 3, 2),
('456 Oak Avenue', 'Condo', 175000, 2, 1);

-- Table: property_features
CREATE TABLE property_features (
    feature_id INT AUTO_INCREMENT PRIMARY KEY,
    feature_name VARCHAR(255) NOT NULL
);

-- Property Features
INSERT INTO property_features (feature_name) VALUES
('Central Air'),
('Garage'),
('Fireplace'),
('Backyard');

-- Table: property_has_features
CREATE TABLE property_has_features (
    property_id INT,
    feature_id INT,
    PRIMARY KEY (property_id, feature_id),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (feature_id) REFERENCES property_features(feature_id)
);

-- Property Has Features
INSERT INTO property_has_features (property_id, feature_id) VALUES
(1, 1), (1, 2),
(2, 1);

-- Table: clients
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    client_email VARCHAR(255) UNIQUE NOT NULL,
    client_phone VARCHAR(20) NOT NULL,
    client_address VARCHAR(255)
);

-- Clients
INSERT INTO clients (client_name, client_email, client_phone) VALUES
('Mustafairfan', 'mustafairfan@email.com', '555-888-9999');

-- Table: showings
CREATE TABLE showings (
    showing_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    agent_id INT NOT NULL,
    client_id INT NOT NULL,
    showing_date DATE NOT NULL,
    showing_time TIME NOT NULL,
    showing_notes TEXT,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Showings
INSERT INTO showings (property_id, agent_id, client_id, showing_date, showing_time) VALUES
(1, 1, 1, '2024-03-10', '14:00:00');

-- Table: offers
CREATE TABLE offers (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    client_id INT NOT NULL,
    offer_amount DECIMAL(10,2) NOT NULL,
    offer_date DATE NOT NULL,
    offer_status VARCHAR(50) DEFAULT 'Pending',
    offer_notes TEXT,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Offers
INSERT INTO offers (property_id, client_id, offer_amount, offer_date) VALUES
(1, 1, 240000, '2024-03-15');

-- Table: contracts
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    offer_id INT NOT NULL,
    agent_id INT NOT NULL,
    contract_date DATE NOT NULL,
    contract_status VARCHAR(50) DEFAULT 'Pending',
    contract_terms TEXT,
    FOREIGN KEY (offer_id) REFERENCES offers(offer_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Contracts
INSERT INTO contracts (offer_id, agent_id, contract_date) VALUES
(1, 1, '2024-03-20');

-- Table: payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    payment_notes TEXT,
    FOREIGN KEY (contract_id) REFERENCES contracts(contract_id)
);

-- Payments
INSERT INTO payments (contract_id, payment_amount, payment_date, payment_method) VALUES
(1, 240000, '2024-03-25', 'Bank Transfer');

-- Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_role VARCHAR(50) NOT NULL, -- "Admin", "Agent", "Client"
    agent_id INT,
    client_id INT,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Users
INSERT INTO users (user_role, agent_id) VALUES
('Admin', NULL),
('Agent', 1),
('Agent', 2);
INSERT INTO users (user_role, client_id) VALUES
('Client', 1);

-- END