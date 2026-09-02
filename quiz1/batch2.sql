-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(150),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Data
INSERT INTO Customers (customer_id, first_name, last_name, email, registration_date) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '2023-03-22'),
(3, 'Michael', 'Johnson', 'mikej@gmail.com', '2023-06-10');

INSERT INTO Products (product_id, name, category, price, stock_quantity) VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99, 150),
(102, 'Mechanical Keyboard', 'Electronics', 89.99, 75),
(103, 'Desk Mat', 'Accessories', 19.50, 200),
(104, 'Monitor Stand', 'Accessories', 45.00, 50);

INSERT INTO Orders (order_id, customer_id, order_date, status) VALUES
(1001, 1, '2023-07-01', 'Pending'),
(1002, 2, '2023-07-05', 'Shipped'),
(1003, 1, '2023-07-10', 'Delivered');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(501, 1001, 101, 2, 25.99),
(502, 1001, 103, 1, 19.50),
(503, 1002, 102, 1, 89.99),
(504, 1003, 104, 1, 45.00);