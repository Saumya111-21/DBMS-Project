CREATE DATABASE elearningplatform;
USE elearningplatform;
-- Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone_Number VARCHAR(15),
    Date_of_Birth DATE
    );
-- Faculty Table
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Specialization VARCHAR(100),
    Contact_Number VARCHAR(15)
);
-- Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Duration VARCHAR(50),
    Max_Students INT,
    Credits INT,
    Faculty_ID INT,
    
    FOREIGN KEY (Faculty_ID) 
        REFERENCES Faculty(Faculty_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
        );
-- Assignment Table
CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Due_Date DATE,
    Total_Marks INT,
    Status VARCHAR(50),
    Course_ID INT,
    
    FOREIGN KEY (Course_ID) 
        REFERENCES Course(Course_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
		);
-- Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Enrollment_Date DATE,
    Status VARCHAR(50),
    Progress DECIMAL(5,2),
    Grade VARCHAR(5),
    Student_ID INT,
    Course_ID INT,
    
    FOREIGN KEY (Student_ID) 
        REFERENCES Student(Student_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    FOREIGN KEY (Course_ID) 
        REFERENCES Course(Course_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
		);
USE elearningplatform;
-- student phone number length modification
ALTER TABLE Student 
MODIFY COLUMN Phone_Number VARCHAR(10);
-- faculty phone number length modification
ALTER TABLE Faculty 
MODIFY COLUMN Contact_Number VARCHAR(10);

-- values entry in faculty table
INSERT INTO Faculty (Name, Email, Specialization, Contact_Number) VALUES
('Dr. Rajesh Kumar', 'rajesh.kumar@college.edu', 'Database Systems', '9876543210'),
('Prof. Anjali Sharma', 'anjali.sharma@college.edu', 'Web Development', '9876543211'),
('Dr. Vikram Singh', 'vikram.singh@college.edu', 'AI & ML', '9876543212'),
('Prof. Priya Patel', 'priya.patel@college.edu', 'Data Structures', '9876543213'),
('Dr. Amit Gupta', 'amit.gupta@college.edu', 'Cloud Computing', '9876543214'),
('Prof. Neha Joshi', 'neha.joshi@college.edu', 'Cybersecurity', '9876543215'),
('Dr. Sanjay Verma', 'sanjay.verma@college.edu', 'Software Engineering', '9876543216'),
('Prof. Ritu Agarwal', 'ritu.agarwal@college.edu', 'Networking', '9876543217'),
('Dr. Manoj Yadav', 'manoj.yadav@college.edu', 'Big Data', '9876543218'),
('Prof. Kavita Rao', 'kavita.rao@college.edu', 'Mobile Computing', '9876543219');

-- values entry in student table
INSERT INTO Student (Name, Email, Phone_Number, Date_of_Birth) VALUES
('Saumya Kashyap', 'saumya@gmail.com', '9876543210', '2002-05-15'),
('Rahul Verma', 'rahul.v@gmail.com', '9876543201', '2001-08-22'),
('Priyanka Singh', 'priyanka.s@gmail.com', '9876543202', '2002-03-10'),
('Amit Sharma', 'amit.sharma@gmail.com', '9876543203', '2001-12-05'),
('Neha Patel', 'neha.patel@gmail.com', '9876543204', '2002-07-18'),
('Rohan Gupta', 'rohan.gupta@gmail.com', '9876543205', '2001-11-30'),
('Divya Joshi', 'divya.joshi@gmail.com', '9876543206', '2002-01-14'),
('Karan Yadav', 'karan.yadav@gmail.com', '9876543207', '2001-09-25'),
('Shreya Mishra', 'shreya.mishra@gmail.com', '9876543208', '2002-04-08'),
('Vikash Kumar', 'vikash.kumar@gmail.com', '9876543209', '2001-06-12');

-- values entry in course table
INSERT INTO Course (Title, Duration, Max_Students, Credits, Faculty_ID) VALUES
('Database Management', '3 months', 30, 4, 1),
('Full Stack Web Dev', '4 months', 25, 5, 2),
('Machine Learning', '3 months', 20, 4, 3),
('Data Structures', '3 months', 35, 3, 4),
('Cloud Computing', '3 months', 25, 4, 5),
('Cybersecurity Basics', '2 months', 20, 3, 6),
('Software Engineering', '4 months', 30, 5, 7),
('Computer Networks', '3 months', 25, 4, 8),
('Big Data Analytics', '3 months', 20, 4, 9),
('Mobile App Dev', '3 months', 25, 4, 10);

-- values entry in assignment table
INSERT INTO Assignment (Title, Due_Date, Total_Marks, Status, Course_ID) VALUES
('ER Diagram Design', '2026-04-10', 20, 'Pending', 1),
('React Project', '2026-04-15', 25, 'Pending', 2),
('Neural Network', '2026-04-12', 30, 'Pending', 3),
('Linked List Impl', '2026-04-08', 20, 'Pending', 4),
('AWS Deployment', '2026-04-20', 25, 'Pending', 5),
('Firewall Config', '2026-04-14', 20, 'Pending', 6),
('UML Diagrams', '2026-04-18', 25, 'Pending', 7),
('TCP/IP Report', '2026-04-11', 20, 'Pending', 8),
('Hadoop Setup', '2026-04-16', 30, 'Pending', 9),
('Android App', '2026-04-22', 25, 'Pending', 10);

-- values entry in enrollment table
INSERT INTO Enrollment (Enrollment_Date, Status, Progress, Grade, Student_ID, Course_ID) VALUES
('2026-03-01', 'Active', 45.50, NULL, 1, 1),
('2026-03-02', 'Active', 60.00, NULL, 2, 2),
('2026-03-03', 'Active', 35.75, NULL, 3, 3),
('2026-03-04', 'Active', 78.25, 'B+', 4, 4),
('2026-03-05', 'Active', 22.00, NULL, 5, 5),
('2026-03-06', 'Completed', 95.50, 'A', 6, 1),
('2026-03-07', 'Active', 55.00, NULL, 7, 2),
('2026-03-08', 'Dropped', 10.00, NULL, 8, 3),
('2026-03-09', 'Active', 82.75, 'A-', 9, 4),
('2026-03-10', 'Active', 40.25, NULL, 10, 5);


-- queries
-- 1. Display the name and email of students born after 2001.
SELECT Name, Email FROM Student WHERE Date_of_Birth > '2001-12-31';

-- 2. List all students and the courses they are enrolled in.
SELECT s.Name AS Student, c.Title AS Course 
FROM Student s 
INNER JOIN Enrollment e ON s.Student_ID = e.Student_ID 
INNER JOIN Course c ON e.Course_ID = c.Course_ID;

-- 3. Show all students with their enrollment status and course names (include students with no enrollments).
SELECT s.Name, c.Title, e.Status 
FROM Student s 
LEFT JOIN Enrollment e ON s.Student_ID = e.Student_ID 
LEFT JOIN Course c ON e.Course_ID = c.Course_ID;

-- 4. Display all enrollment records with course titles and student names (prioritize enrollments).
SELECT c.Title, s.Name, e.Progress 
FROM Course c 
RIGHT JOIN Enrollment e ON c.Course_ID = e.Course_ID 
RIGHT JOIN Student s ON e.Student_ID = s.Student_ID;

-- 5. Show all possible combinations of students, their enrollments, and courses (complete matching).
SELECT s.Name, c.Title, e.Status 
FROM Student s 
LEFT JOIN Enrollment e ON s.Student_ID = e.Student_ID 
LEFT JOIN Course c ON e.Course_ID = c.Course_ID
UNION
SELECT s.Name, c.Title, e.Status 
FROM Course c 
LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID 
LEFT JOIN Student s ON e.Student_ID = s.Student_ID
WHERE s.Student_ID IS NULL OR e.Student_ID IS NULL;

-- 6. For each course, show total enrolled students and average progress percentage.
SELECT c.Title, COUNT(e.Enrollment_ID) as Total_Students, AVG(e.Progress) as Avg_Progress
FROM Course c 
LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID 
GROUP BY c.Course_ID, c.Title;

-- 7.List courses that have more than 1 student enrolled.
SELECT c.Title, COUNT(e.Student_ID) as Student_Count
FROM Course c 
LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID 
GROUP BY c.Course_ID, c.Title 
HAVING COUNT(e.Student_ID) > 1;

-- 8. Find students who have progress greater than 50% in any course.
SELECT Name FROM Student 
WHERE Student_ID IN (
    SELECT Student_ID FROM Enrollment 
    WHERE Progress > 50
);

-- 9. List all faculty members who teach at least one course.
SELECT Name FROM Faculty f 
WHERE EXISTS (
    SELECT 1 FROM Course c WHERE c.Faculty_ID = f.Faculty_ID
);

-- 10. Display all unique names from both Student and Faculty tables.
SELECT Name AS Person FROM Student 
UNION 
SELECT Name AS Person FROM Faculty;

-- 11. Find all pairs of students enrolled in the same course.
SELECT DISTINCT s1.Name as Student1, s2.Name as Student2
FROM Enrollment e1 
JOIN Enrollment e2 ON e1.Course_ID = e2.Course_ID 
JOIN Student s1 ON e1.Student_ID = s1.Student_ID 
JOIN Student s2 ON e2.Student_ID = s2.Student_ID 
WHERE s1.Student_ID < s2.Student_ID;

-- 12. Show top 5 students by their highest progress percentage.
SELECT s.Name, e.Progress 
FROM Student s 
JOIN Enrollment e ON s.Student_ID = e.Student_ID 
ORDER BY e.Progress DESC 
LIMIT 5;

-- 13. Convert numeric progress to letter grades (A=90+, B=80+, C=70+, F=below 70).
SELECT 
    s.Name,
    e.Progress,
    CASE 
        WHEN e.Progress >= 90 THEN 'A'
        WHEN e.Progress >= 80 THEN 'B'
        WHEN e.Progress >= 70 THEN 'C'
        ELSE 'F'
    END AS Letter_Grade
FROM Enrollment e 
JOIN Student s ON e.Student_ID = s.Student_ID;

-- 14. For each course, display total assignments, average marks, and highest marks.
SELECT 
    c.Title,
    COUNT(a.Assignment_ID) as Total_Assignments,
    AVG(a.Total_Marks) as Avg_Marks,
    MAX(a.Total_Marks) as Highest_Marks
FROM Course c 
LEFT JOIN Assignment a ON c.Course_ID = a.Course_ID 
GROUP BY c.Course_ID, c.Title;

-- 15. Show faculty teaching active courses with upcoming assignments that have 2 or more active students, sorted by most popular.
SELECT 
    f.Name as Faculty_Name,
    c.Title as Course,
    COUNT(e.Student_ID) as Active_Students
FROM Faculty f 
JOIN Course c ON f.Faculty_ID = c.Faculty_ID 
JOIN Enrollment e ON c.Course_ID = e.Course_ID 
WHERE e.Status = 'Active'
    AND c.Course_ID IN (
        SELECT Course_ID FROM Assignment 
        WHERE Due_Date > CURDATE()
    )
GROUP BY f.Faculty_ID, c.Course_ID, f.Name, c.Title
HAVING COUNT(e.Student_ID) >= 2
ORDER BY Active_Students DESC;



USE elearningplatform;
SELECT 
    s.Name AS Student_Name,
    s.Student_ID AS Roll_Number,
    c.Title AS Course,
    a.Title AS Assignment
FROM 
    Student s
    JOIN Enrollment e ON s.Student_ID = e.Student_ID
    JOIN Course c ON e.Course_ID = c.Course_ID
    JOIN Assignment a ON c.Course_ID = a.Course_ID
WHERE 
    s.Student_ID = 1;  
SELECT s.NAME AS STUDENT_NAME,
c.TITLE AS COURSE FROM STUDENT s 
JOIN ENROLLMENT e ON s.STUDENT_ID = e.STUDENT_ID
JOIN COURSE c ON e.COURSE_ID=c.COURSE_ID;

USE elearningplatform;

-- my database is already mostly normalized 
-- It is very close to 3NF (Third Normal Form) because:
-- No repeating groups 
-- No partial dependency 
-- No transitive dependency 

CREATE TABLE IF NOT EXISTS Status (
    Status_ID INT PRIMARY KEY AUTO_INCREMENT,
    Status_Name VARCHAR(50) UNIQUE
);

INSERT IGNORE INTO Status (Status_Name) VALUES
('Active'), ('Completed'), ('Dropped'), ('Pending');

ALTER TABLE Course MODIFY Faculty_ID INT NULL;
ALTER TABLE Assignment 
ADD COLUMN Status_ID INT;

ALTER TABLE Enrollment ADD COLUMN Status_ID INT;
ALTER TABLE Enrollment ADD COLUMN Grade_ID INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE Assignment a
JOIN Status s ON a.Status = s.Status_Name
SET a.Status_ID = s.Status_ID;

-- Enrollment → Status_ID
UPDATE Enrollment e
JOIN Status s ON e.Status = s.Status_Name
SET e.Status_ID = s.Status_ID;

-- Enrollment → Grade_ID
UPDATE Enrollment e
JOIN Grade g ON e.Grade = g.Grade_Name
SET e.Grade_ID = g.Grade_ID;

ALTER TABLE Assignment 
ADD CONSTRAINT fk_assignment_status 
FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID);

ALTER TABLE Enrollment 
ADD CONSTRAINT fk_enrollment_status 
FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID),
ADD CONSTRAINT fk_enrollment_grade 
FOREIGN KEY (Grade_ID) REFERENCES Grade(Grade_ID);
ALTER TABLE Assignment DROP COLUMN Status;
ALTER TABLE Enrollment DROP COLUMN Status;
ALTER TABLE Enrollment DROP COLUMN Grade;
ALTER TABLE Course ADD COLUMN Duration_Months INT;

UPDATE Course 
SET Duration_Months = 
    CASE 
        WHEN Duration = '2 months' THEN 2
        WHEN Duration = '3 months' THEN 3
        WHEN Duration = '4 months' THEN 4
    END;

ALTER TABLE Course DROP COLUMN Duration;

-- My database is now:
-- Fully normalized (3NF)
-- No redundancy
-- No update anomalies
-- Proper foreign key design




