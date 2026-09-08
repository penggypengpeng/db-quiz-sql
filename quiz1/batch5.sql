-- Create Trainers Table
CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(50),
    hourly_rate DECIMAL(6, 2)
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    membership_tier VARCHAR(20),
    join_date DATE
);

-- Create Classes Table
CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100),
    trainer_id INT,
    fee DECIMAL(6, 2),
    capacity INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- Create Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    member_id INT,
    class_id INT,
    booking_date DATE,
    attendance_status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Insert Sample Data
INSERT INTO Trainers (trainer_id, name, specialty, hourly_rate) VALUES
(1, 'Alex Vance', 'CrossFit', 45.00),
(2, 'Maria Santos', 'Yoga & Pilates', 50.00),
(3, 'David Kim', 'Strength Training', 40.00),
(4, 'Rachel Green', 'HIIT', 55.00);

INSERT INTO Members (member_id, name, email, membership_tier, join_date) VALUES
(1001, 'Carlos Mendoza', 'carlos.m@gmail.com', 'Gold', '2023-01-10'),
(1002, 'Samantha Reed', 'sreed@yahoo.com', 'Standard', '2023-03-15'),
(1003, 'Liam Chen', 'lchen@gmail.com', 'VIP', '2023-06-20'),
(1004, 'Emma Watson', 'ewatson@outlook.com', 'Standard', '2023-09-01');

INSERT INTO Classes (class_id, class_name, trainer_id, fee, capacity) VALUES
(201, 'Morning Power Yoga', 2, 20.00, 15),
(202, 'Heavyweight Bootcamp', 3, 35.00, 10),
(203, 'HIIT Cardio Burn', 4, 25.00, 20),
(204, 'Advanced CrossFit', 1, 30.00, 12);

INSERT INTO Bookings (booking_id, member_id, class_id, booking_date, attendance_status) VALUES
(5001, 1001, 201, '2023-10-01', 'Attended'),
(5002, 1002, 203, '2023-10-02', 'Cancelled'),
(5003, 1003, 202, '2023-10-03', 'Attended'),
(5004, 1004, 201, '2023-10-05', 'Attended'),
(5005, 1001, 204, '2023-10-06', 'Cancelled');