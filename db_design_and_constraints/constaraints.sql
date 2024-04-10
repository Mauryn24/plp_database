-- Creating tables

-- Students table with primary key
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18)
);

-- Courses table with primary key
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

-- Enrollments table with foreign keys
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Adding unique constraint to Students table
ALTER TABLE Students
ADD CONSTRAINT UQ_StudentEmail UNIQUE (Email);

-- Inserting sample data
INSERT INTO Students (StudentID, FirstName, LastName, Age, Email)
VALUES (1, 'John', 'Doe', 20, 'john.doe@example.com');

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Mathematics', 4),
       (102, 'History', 3),
       (103, 'Science', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade)
VALUES (1, 1, 101, 'A'),
       (2, 1, 102, 'B');

-- Updating data
UPDATE Students
SET Age = 21
WHERE StudentID = 1;

-- Removing unique constraint from Students table
ALTER TABLE Students
DROP CONSTRAINT UQ_StudentEmail;
