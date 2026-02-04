
CREATE DATABASE IF NOT EXISTS assignment_tracker;
USE assignment_tracker;

-- Students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Subjects table
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id) ON DELETE CASCADE
);


-- Assignments table
CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id) ON DELETE CASCADE
);

-- Progress table
CREATE TABLE progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT,
    completed_on DATE,
    FOREIGN KEY (assignment_id) REFERENCES assignments (assignment_id) ON DELETE CASCADE
);
   