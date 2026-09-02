-- Create Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    publish_year INT,
    price DECIMAL(5, 2),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    join_date DATE,
    status VARCHAR(20)
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert Sample Data
INSERT INTO Authors (author_id, name, country) VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George R.R. Martin', 'USA'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Chimamanda Ngozi Adichie', 'Nigeria');

INSERT INTO Books (book_id, title, author_id, publish_year, price) VALUES
(101, 'Harry Potter and the Sorcerers Stone', 1, 1997, 19.99),
(102, 'A Game of Thrones', 2, 1996, 24.99),
(103, 'Norwegian Wood', 3, 1987, 14.50),
(104, 'Half of a Yellow Sun', 4, 2006, 16.00),
(105, 'A Clash of Kings', 2, 1998, 22.50);

INSERT INTO Members (member_id, name, join_date, status) VALUES
(1001, 'Alice Smith', '2021-05-12', 'Active'),
(1002, 'Bob Johnson', '2022-08-20', 'Inactive'),
(1003, 'Charlie Brown', '2023-01-15', 'Active');

INSERT INTO Loans (loan_id, book_id, member_id, loan_date, return_date) VALUES
(501, 101, 1001, '2023-09-01', '2023-09-15'),
(502, 103, 1002, '2023-08-10', '2023-08-24'),
(503, 102, 1003, '2023-09-05', NULL);