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



