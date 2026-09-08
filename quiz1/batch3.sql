-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    building VARCHAR(50)
);

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gpa DECIMAL(3, 2),
    enrollment_year INT
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(150),
    department_id INT,
    credits INT,
    fee DECIMAL(6, 2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Sample Data
INSERT INTO Departments (department_id, department_name, building) VALUES
(1, 'Computer Science', 'Turing Hall'),
(2, 'Mathematics', 'Euler Building'),
(3, 'Literature', 'Shakespeare Hall');

INSERT INTO Students (student_id, first_name, last_name, email, gpa, enrollment_year) VALUES
(201, 'Alex', 'Rivera', 'arivera@university.edu', 3.85, 2021),
(202, 'Jordan', 'Lee', 'jlee@university.edu', 2.90, 2022),
(203, 'Taylor', 'Swift', 'tswift@university.edu', 3.95, 2020),
(204, 'Morgan', 'Freeman', 'mfreeman@gmail.com', 3.10, 2023);

INSERT INTO Courses (course_id, course_name, department_id, credits, fee) VALUES
(101, 'Database Systems', 1, 4, 350.00),
(102, 'Calculus I', 2, 3, 275.00),
(103, 'World Literature', 3, 3, 220.00),
(104, 'Algorithms & Data Structures', 1, 4, 400.00);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade, semester) VALUES
(1, 201, 101, 'A', 'Fall 2023'),
(2, 202, 102, 'C', 'Fall 2023'),
(3, 203, 103, 'A', 'Spring 2024'),
(4, 204, 101, 'F', 'Spring 2024');