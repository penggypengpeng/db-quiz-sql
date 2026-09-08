-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50),
    hire_date DATE
);

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    city VARCHAR(50)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    fee DECIMAL(8, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Prescriptions Table
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Insert Sample Data
INSERT INTO Doctors (doctor_id, first_name, last_name, specialty, hire_date) VALUES
(1, 'Sarah', 'Connor', 'Cardiology', '2015-03-12'),
(2, 'Gregory', 'House', 'Diagnostics', '2018-07-22'),
(3, 'Meredith', 'Grey', 'General Surgery', '2020-01-10'),
(4, 'Leonard', 'McCoy', 'Pediatrics', '2021-09-05');

INSERT INTO Patients (patient_id, first_name, last_name, birth_date, city) VALUES
(101, 'Arthur', 'Dent', '1982-05-11', 'Seattle'),
(102, 'Diana', 'Prince', '1990-08-25', 'Chicago'),
(103, 'Bruce', 'Wayne', '1975-02-19', 'Seattle'),
(104, 'Clark', 'Kent', '1988-12-01', 'Austin');

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, fee) VALUES
(501, 101, 1, '2023-10-01', 150.00),
(502, 102, 2, '2023-10-03', 300.00),
(503, 103, 3, '2023-10-05', 220.00),
(504, 104, 1, '2023-10-12', 175.00),
(505, 101, 4, '2023-10-15', 90.00);

INSERT INTO Prescriptions (prescription_id, appointment_id, medication_name, dosage) VALUES
(901, 501, 'Lisinopril', '10mg daily'),
(902, 502, 'Amoxicillin', '500mg twice daily'),
(903, 503, 'Ibuprofen', '400mg as needed'),
(904, 505, 'Multivitamin', '1 tablet daily');