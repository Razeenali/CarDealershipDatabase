-- Drop the database if it already exists (optional)
DROP DATABASE IF EXISTS dealership_database;

-- Create the database
CREATE DATABASE dealership_database;
USE dealership_database;

-- Table 1: Dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12)
);

-- Table 2: Vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(20),
    sold BOOLEAN DEFAULT FALSE
);

-- Table 3: Inventory
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: Sales Contracts
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 5 (Optional): Lease Contracts
CREATE TABLE lease_contracts (
    lease_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    lease_term_months INT,
    monthly_payment DECIMAL(10, 2),
    start_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
