# University Registration Database Normalization (1NF - 3NF)

## overview ....
The purpose of this lab is to demonstrate the process of database normalization. We take a flat, unnormalized dataset and apply normalization rules (1NF, 2NF, and 3NF) to eliminate redundancy and improve data integrity.

## Introduction
Normalization is a database design technique that reduces data redundancy and eliminates undesirable characteristics like Insertion, Update, and Deletion Anomalies. In this project, we have decomposed a single table into four related tables:
1. **Majors**: Stores academic majors and their advisors.
2. **Students**: Stores student personal information.
3. **Courses**: Stores course catalog details.
4. **Enrollments**: Stores student-course mapping with grades.

---

## SCHEMAS

### 1. Majors Table (Major, Advisor)
**SQL QUERY:**

```sql
CREATE TABLE Majors (
    Major VARCHAR(50) PRIMARY KEY,
    Advisor VARCHAR(100) NOT NULL
);

Table Description
describe Majors;
Result
+---------+-----------+
| Major   | Advisor   |
+---------+-----------+
| CS      | Dr. Smith |
| Physics | Dr. Lee   |
+---------+-----------+
2 rows in set (0.00 sec)

### 1. Student Table (StudentID, Name Email Major)

**SQL QUERY:**


mysql> CREATE TABLE Students (
    ->     StudentID VARCHAR(10) PRIMARY KEY,
    ->     Name VARCHAR(100) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE NOT NULL,
    ->     Major VARCHAR(50),
    ->     FOREIGN KEY (Major) REFERENCES Majors(Major)
    -> );
Query OK, 0 rows affected (0.04 sec)

###Table Description

describe Student;
Result

+-----------+-------+---------------+---------+
| StudentID | Name  | Email         | Major   |
+-----------+-------+---------------+---------+
| S101      | Alice | alice@uni.edu | CS      |
| S102      | Bob   | bob@uni.edu   | CS      |
| S103      | Carol | carol@uni.edu | Physics |
+-----------+-------+---------------+---------+
3 rows in set (0.00 sec)

### 1.  Courses Table (CourseID, CourseTitle, Credits, Building, Room)

**SQL QUERY:**
mysql> CREATE TABLE Courses (
    ->     CourseID VARCHAR(10) PRIMARY KEY,
    ->     CourseTitle VARCHAR(100) NOT NULL,
    ->     Credits INT NOT NULL,
    ->     Building VARCHAR(50),
    ->     Room VARCHAR(10)
    -> );
Query OK, 0 rows affected (0.04 sec)

###Table Description

describe Course;
Result
+----------+----------------+---------+-----------+------+
| CourseID | CourseTitle    | Credits | Building  | Room |
+----------+----------------+---------+-----------+------+
| CS301    | Algorithms     |       4 | Science   | 205  |
| MATH201  | Linear Algebra |       3 | Math Wing | 101  |
| PHYS101  | Mechanics      |       4 | Science   | 301  |
+----------+----------------+---------+-----------+------+
3 rows in set (0.00 sec)

### 1. Enrollments Table (StudentID, CourseID, Grade)

**SQL QUERY:**

mysql> CREATE TABLE Enrollments (
    ->     StudentID VARCHAR(10),
    ->     CourseID VARCHAR(10),
    ->     Grade CHAR(1),
    ->     PRIMARY KEY (StudentID, CourseID),
    ->     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    ->     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
    -> );

###Table Description

describe Enrollments;
Result

 Enrollments;
+-----------+----------+-------+
| StudentID | CourseID | Grade |
+-----------+----------+-------+
| S101      | CS301    | A     |
| S101      | MATH201  | B     |
| S102      | CS301    | C     |
| S103      | PHYS101  | A     |
+-----------+----------+-------+
4 rows in set (0.00 sec)

### 1. Data Verification (Final Output)
**SQL QUERY:**

mysql> SELECT
    ->     s.StudentID,
    ->     s.Name,
    ->     s.Major,
    ->     m.Advisor,
    ->     c.CourseTitle,
    ->     e.Grade,
    ->     c.Building,
    ->     c.Room
    -> FROM Students s
    -> JOIN Majors m ON s.Major = m.Major
    -> JOIN Enrollments e ON s.StudentID = e.StudentID
    -> JOIN Courses c ON e.CourseID = c.CourseID;

###Final Description

describe -Final Verification  ;
Result 
+-----------+-------+---------+-----------+----------------+-------+-----------+------+
| StudentID | Name  | Major   | Advisor   | CourseTitle    | Grade | Building  | Room |
+-----------+-------+---------+-----------+----------------+-------+-----------+------+
| S101      | Alice | CS      | Dr. Smith | Algorithms     | A     | Science   | 205  |
| S101      | Alice | CS      | Dr. Smith | Linear Algebra | B     | Math Wing | 101  |
| S102      | Bob   | CS      | Dr. Smith | Algorithms     | C     | Science   | 205  |
| S103      | Carol | Physics | Dr. Lee   | Mechanics      | A     | Science   | 301  |
+-----------+-------+---------+-----------+----------------+-------+-----------+------+
4 rows in set (0.00 sec)
