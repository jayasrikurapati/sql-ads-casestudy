-- Create the SDM database
CREATE DATABASE SDM;
-- Create the SDM database

USE SDM;

CREATE TABLE students ( student_id INT PRIMARY KEY, name VARCHAR(50), date_of_birth DATE, address VARCHAR(100), contact_number VARCHAR(15));

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  name VARCHAR(50),
  description VARCHAR(200),
  credits INT
);
CREATE TABLE grades (
  grade FLOAT,
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE enrollments (
  enrollment_date DATE,
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- Add new student
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (1, 'John Doe', '1995-07-15', '123 Main Street', '555-1234');

-- Retrieve student info
SELECT * FROM students WHERE student_id = 1;

-- Add new course
INSERT INTO courses (course_id, name, description, credits)
VALUES (101, 'Mathematics', 'Introduction to Calculus', 3);

-- Retrieve course info
SELECT * FROM courses WHERE course_id = 101;

-- Record a students grade for a specific course
INSERT INTO grades (student_id, course_id, grade)
VALUES (1, 101, 85.5);

-- Update student grade for a course
UPDATE grades SET grade = 90.0 WHERE student_id = 1 AND course_id = 101;

-- Enroll
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, '2023-01-01');

-- Retrieve
SELECT courses.* FROM courses JOIN enrollments ON courses.course_id = enrollments.course_id WHERE enrollments.student_id = 1;

-- Reporting
SELECT AVG(grade) FROM grades WHERE student_id = 1;

-- Display top-performing students:
SELECT students.*, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.student_id = grades.student_id
GROUP BY students.student_id
ORDER BY average_grade DESC
LIMIT 10;








