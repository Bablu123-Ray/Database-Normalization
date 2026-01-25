Database Normalization Lab (1NF to 3NF)

 Project Overview
This repository contains the SQL implementation for the Database Normalization Lab. The goal was to convert an unnormalized university dataset into *Third Normal Form (3NF) to reduce redundancy and improve data integrity.

 File Structure
schema.sql: Contains CREATE TABLE commands to set up the 3NF Schema (Majors, Students, Courses, Enrollments).
seeds.sql: Contains INSERT INTO commands to populate the tables with sample data.
queries.sql: Contains the JOIN query used to verify that the original data can be reconstructed without loss.

 Normalization Steps Taken
1. 1NF: Ensured atomicity of data.
2. 2NF: Removed partial dependencies (Separated Student & Course details).
3. 3NF: Removed transitive dependencies (Moved Advisor to Majors table).

Submitted by: Bablu kumar Ray
