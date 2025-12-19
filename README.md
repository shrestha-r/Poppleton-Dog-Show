Poppleton Dog Show Web Application

Module: CIS2360 – Database-Driven Web Applications
Academic Year: 2024/2025
Student: Rahul Shrestha

1. Project Overview

This project is a database-driven web application developed for the Poppleton Dog Show.
It allows members of the public to browse dog show data such as dogs, breeds, owners, events, rankings, and winners without requiring an account.

Optional user authentication is provided for registered users and administrators. The application focuses on secure database access, correct SQL querying, and a clean, responsive user interface while preserving the integrity of the original dataset provided for the assignment.

2. Technologies Used

Backend: PHP 8 (PDO)

Database: MariaDB / MySQL

Web Server: Apache (XAMPP)

Frontend: HTML5, CSS3, JavaScript

Development Tools: Visual Studio Code, phpMyAdmin

Operating System: Linux (Zorin OS)

3. Project File Structure
CIS2360_DOG_SHOW/
│
├── assets/
│   ├── css/
│   │   └── styles.css
│   ├── images/
│   │   └── uploads/
│   └── js/
│       └── scripts.js
│
├── core/
│   ├── config.php
│   ├── db.php
│   └── database_sql/
│       └── cis2360_dog_show.sql
│
├── public/
│   ├── auth/
│   │   ├── 01_login.php
│   │   ├── 02_register.php
│   │   ├── 03_logout.php
│   │   └── 04_profile.php
│   ├── partials/
│   │   ├── header.php
│   │   └── footer.php
│   ├── 01_index.php
│   ├── 02_about.php
│   ├── 03_dogs.php
│   ├── 04_contact.php
│   └── owner.php
│
├── .gitignore
└── README.md

4. Database Setup
4.1 Import Database

Open phpMyAdmin

Create a database named:

cis2360_dog_show


Import the provided SQL file:

core/database_sql/cis2360_dog_show.sql


This will create all tables, constraints, and sample data required to run the application.

5. Database User Configuration (Recommended)

For security reasons, the application is configured to use a limited database user instead of MySQL root.

Run the following SQL commands as root in phpMyAdmin or MySQL CLI:

CREATE USER 'user0'@'localhost' IDENTIFIED BY 'FirstUserPass#010';

GRANT SELECT, INSERT, UPDATE ON cis2360_dog_show.* TO 'user0'@'localhost';

FLUSH PRIVILEGES;


This user has only the permissions required by the application.

5.1 Fallback Option (Root User)

If the above user is not created, you may edit the following file:

core/config.php


And switch to root credentials instead:

define('DB_USER', 'root');
define('DB_PASS', '');

6. Application Configuration

Ensure the following settings exist in core/config.php:

define('DB_HOST', 'localhost');
define('DB_NAME', 'cis2360_dog_show');
define('DB_USER', 'user0');
define('DB_PASS', 'FirstUserPass#010');

define('APP_NAME', 'Poppleton Dog Show');
define('APP_URL', 'http://localhost/cis2360_dog_show');
define('UPLOAD_PATH', __DIR__ . '/../assets/images/');

7. Running the Application

Start Apache and MySQL in XAMPP

Place the project folder inside:

htdocs/


Open your browser and navigate to:

http://localhost/cis2360_dog_show/public/01_index.php

8. Authentication

Registration and login are optional

Public users can view all dog show data

Logged-in users see a Profile / Logout option

Passwords are securely stored using password_hash()

Sessions are used to manage login state

9. Security Measures

Prepared statements (PDO) used throughout

SQL injection prevention via bound parameters

Password hashing and verification

Output escaping using htmlspecialchars()

Role-based access for admin functionality

10. Notes for Assessment

The original dataset schema was preserved

Additional tables (users, dog_images) were added without modifying core tables

Image data is stored as URLs, not binary blobs

Placeholder images are shown where no image exists

All SQL queries were written and tested manually

11. Conclusion

This project demonstrates the development of a secure, database-driven web application that adheres to best practices in SQL querying, PHP programming, and UI design. The Poppleton Dog Show application presents complex relational data in a clear and accessible way while meeting the academic requirements of the CIS2360 module.