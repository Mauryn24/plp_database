-- Step 1: Create a new MySQL database named "UniversityDB"
CREATE DATABASE UniversityDB;

-- Step 2: Design a table named "Students"
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Major VARCHAR(50)
);

-- Step 3: Insert at least 5 records into the "Students" table with sample data
INSERT INTO Students (StudentID, FirstName, LastName, Age, Major) 
VALUES 
    (1, 'John', 'Doe', 20, 'Computer Science'),
    (2, 'Jane', 'Smith', 21, 'Biology'),
    (3, 'Michael', 'Johnson', 22, 'History'),
    (4, 'Emily', 'Brown', 19, 'Mathematics'),
    (5, 'David', 'Wilson', 20, 'Chemistry');

-- Step 4: Alter the "Students" table to add a new column named "GPA" with a data type appropriate for storing decimal values
ALTER TABLE Students
ADD GPA DECIMAL(4, 2);

-- Step 5: Insert GPA values for the existing records in the "Students" table
UPDATE Students
SET GPA = ROUND(RAND() * (4.0 - 2.0) + 2.0, 2);

-- Step 6: Rename the table from "Students" to "EnrolledStudents"
ALTER TABLE Students RENAME TO EnrolledStudents;

-- Step 7: Create a new table named "Courses"
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100),
    Credits INT
);

-- Step 8: Insert at least 3 records into the "Courses" table with sample data
INSERT INTO Courses (CourseID, CourseName, Instructor, Credits) 
VALUES 
    (1, 'Introduction to Computer Science', 'Dr. Smith', 3),
    (2, 'Biology 101', 'Prof. Johnson', 4),
    (3, 'History of Art', 'Dr. Martinez', 3);

-- Step 9: Drop the "EnrolledStudents" table from the database
DROP TABLE EnrolledStudents;
