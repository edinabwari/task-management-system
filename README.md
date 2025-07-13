# Task Management System

A lightweight PHP-based Task Management System built for the Cytonn Software Engineering Internship Challenge.

## Features

- Admin panel to:
  - Add, edit, delete users
  - Assign tasks with deadlines
- Users can:
  - View tasks assigned to them
  - Update task status: Pending, In Progress, Completed
- Email notifications sent automatically when a task is assigned
- Responsive layout with basic styling using CSS and vanilla JavaScript

## Technologies Used

- PHP 
- MySQL (via phpMyAdmin)
- HTML, CSS
- JavaScript (Vanilla)
- PHPMailer 

##  Live Demo

[Click to View Live System](hhttps://tasksystem.fwh.is/login.php)  
*(Hosted on InfinityFree)*

##  How to Set Up Locally

1. Install [XAMPP](https://www.apachefriends.org/)
2. Place the project folder in `htdocs/`
3. Import `task_management_db.sql` into phpMyAdmin
4. Update `DB_connection.php` with your local credentials (usually `localhost`, `root`, no password)
5. Start Apache and MySQL from XAMPP
6. Access the system via `http://localhost/task-management-system`

## Default Admin Credentials
- Username: EdinaAdmin
- email : edinakwambokabwari@gmail.com
- Password: @Edina123

