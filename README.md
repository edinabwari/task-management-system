# Task Management System

A PHP-based Task Management System built for 2025 Cytonn Software Engineering Internship Challenge.

## Features

### Admin Panel to allow admin to:
- Add, edit, and delete users
- [Admin](https://github.com/edinabwari/task-management-system/blob/main/img/adminadduser.png)
- Assign tasks with deadline dates
- View all tasks in the system
- logout 

### User Panel
- View tasks assigned to them
- Update task status: `Pending`, `In Progress`, `Completed`
- View their profile details
- View system notifications
- logout 

### Notifications
- Email alerts sent automatically to users when tasks are assigned to them.
- User are able to also see notifications on the system.

## Technologies Used

- PHP 
- MySQL (via phpMyAdmin)
- HTML, CSS
- JavaScript (Vanilla)
- PHPMailer 

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


##  Database

- **Database Name:** `task_management_db`
- **SQL Dump File:** `task_management_db.sql`
- **Database Type:** MySQL 

