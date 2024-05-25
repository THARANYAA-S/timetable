create database generation;
 
CREATE TABLE Department (
    department_name VARCHAR(100) PRIMARY KEY
);

INSERT INTO Department (department_name) VALUES 
('EEE'),
('ECE'),
('IT'),
('CS');
CREATE TABLE Semester (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(100)
);

INSERT INTO Semester (semester_id, semester_name) VALUES 
(1, 'Semester 1'),
(2, 'Semester 2'),
(3, 'Semester 3'),
(4, 'Semester 4'),
(5, 'Semester 5'),
(6, 'Semester 6');


CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    department_name VARCHAR(100),
    FOREIGN KEY (department_name) REFERENCES Department(department_name)
);

INSERT INTO Staff (staff_id, staff_name, department_name) VALUES 
(101, 'Gopika', 'EEE'),
(102, 'Riya', 'EEE');
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    department_name VARCHAR(100),
    semester_id INT,
    FOREIGN KEY (department_name) REFERENCES Department(department_name),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);

INSERT INTO Subject (subject_id, subject_name, department_name, semester_id) VALUES 
(201, 'DSP', 'EEE', 6),
(202, 'LIC', 'EEE', 6);

CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY,
    classroom_name VARCHAR(100)
);

INSERT INTO Classroom (classroom_id, classroom_name) VALUES 
(001, 'SF'),
(002, 'SF');
 UPDATE Classroom
SET classroom_name = "SF001"
WHERE classroom_id=2;   


DELETE FROM Classroom 
where  classroom_id=302;
CREATE TABLE Timing (
    timing_id INT PRIMARY KEY AUTO_INCREMENT,
    start_time TIME,
    end_time TIME GENERATED ALWAYS AS (start_time + INTERVAL 1 HOUR) VIRTUAL,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')
);

INSERT INTO Timing (start_time, day_of_week) VALUES
('08:45:00', 'Monday'),
('09:45:00', 'Monday'),
('11:00:00', 'Monday'),
('12:00:00', 'Monday'),
('02:00:00', 'Monday'),
('03:15:00', 'Monday'),

('08:45:00', 'Tuesday'),
('09:45:00', 'Tuesday'),
('11:00:00', 'Tuesday'),
('12:00:00', 'Tuesday'),
('02:00:00', 'Tuesday'),
('03:15:00', 'Tuesday'),

('08:45:00', 'Wednesday'),
('09:45:00', 'Wednesday'),
('11:00:00', 'Wednesday'),
('12:00:00', 'Wednesday'),
('02:00:00', 'Wednesday'),
('03:15:00', 'Wednesday'),

('08:45:00', 'Thursday'),
('09:45:00', 'Thursday'),
('11:00:00', 'Thursday'),
('12:00:00', 'Thursday'),
('02:00:00', 'Thursday'),
('03:15:00', 'Thursday'),

('08:45:00', 'Friday'),
('09:45:00', 'Friday'),
('11:00:00', 'Friday'),
('12:00:00', 'Friday'),
('02:00:00', 'Friday'),
('03:15:00', 'Friday'),

('08:45:00', 'Saturday'),
('09:45:00', 'Saturday'),
('11:00:00', 'Saturday'),
('12:00:00', 'Saturday'),
('02:00:00', 'Saturday'),
('03:15:00', 'Saturday');
CREATE TABLE Timetable (
    timetable_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    subject_id INT,
    classroom_id INT,
    timing_id INT,
    semester_id INT,
    department_name VARCHAR(100),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id),
    FOREIGN KEY (timing_id) REFERENCES Timing(timing_id),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id),
    FOREIGN KEY (department_name) REFERENCES Department(department_name)
);

INSERT INTO Timetable (staff_id, subject_id, classroom_id, timing_id, semester_id, department_name) VALUES 
(101, 201, 1, 1, 6, 'EEE'),
(102, 202, 2, 2, 6, 'EEE');
 
SELECT 
    s.staff_name, 
    sb.subject_name, 
    c.classroom_name,
     t.start_time, 
     t.end_time,
    t.day_of_week 
FROM 
    Timetable tt 
JOIN 
    Staff s ON tt.staff_id = s.staff_id 
JOIN 
    Subject sb ON tt.subject_id = sb.subject_id 
JOIN 
    Classroom c ON tt.classroom_id = c.classroom_id 
JOIN 
    Timing t ON tt.timing_id = t.timing_id 
JOIN 
    Semester sem ON tt.semester_id = sem.semester_id
WHERE 
    tt.semester_id = 6 
    AND tt.department_name = 'EEE'
ORDER BY 
    t.day_of_week, t.start_time;

