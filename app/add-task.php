<?php
session_start();

// ✅ Load PHPMailer dependencies (must be before any logic)
require '../phpmailer/PHPMailer.php';
require '../phpmailer/SMTP.php';
require '../phpmailer/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if (isset($_SESSION['role']) && isset($_SESSION['id'])) {

    if (
        isset($_POST['title']) &&
        isset($_POST['description']) &&
        isset($_POST['assigned_to']) &&
        $_SESSION['role'] == 'admin' &&
        isset($_POST['due_date'])
    ) {
        include "../DB_connection.php";
        include "Model/Task.php";
        include "Model/Notification.php";
        include "Model/User.php"; // Needed for get_user_email_by_id()

        function validate_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }

        $title = validate_input($_POST['title']);
        $description = validate_input($_POST['description']);
        $assigned_to = validate_input($_POST['assigned_to']);
        $due_date = validate_input($_POST['due_date']);

        if (empty($title)) {
            $em = "Title is required";
            header("Location: ../create_task.php?error=$em");
            exit();
        } elseif (empty($description)) {
            $em = "Description is required";
            header("Location: ../create_task.php?error=$em");
            exit();
        } elseif ($assigned_to == 0) {
            $em = "Select User";
            header("Location: ../create_task.php?error=$em");
            exit();
        } else {
            // Insert the task
            $data = array($title, $description, $assigned_to, $due_date);
            insert_task($conn, $data);

            // Insert system notification
            $notif_data = array(
                "'$title' has been assigned to you. Please review and start working on it",
                $assigned_to,
                'New Task Assigned'
            );
            insert_notification($conn, $notif_data);

            // Fetch user email and name
            $user_data = get_user_email_by_id($conn, $assigned_to);
            $user_email = $user_data['email'];
            $user_name  = $user_data['full_name'];

            // Send email notification
            $mail = new PHPMailer(true);

            try {
                $mail->isSMTP();
                $mail->Host       = 'smtp.gmail.com';
                $mail->SMTPAuth   = true;
                $mail->Username   = 'bwarikwambokaedina@gmail.com';      // Replace with your email
                $mail->Password   = 'uorg luig fvec lbja';         // Replace with your App Password
                $mail->SMTPSecure = 'tls';
                $mail->Port       = 587;

                $mail->setFrom('bwarikwambokaedina@gmail.com', 'Edina Task Admin');
                $mail->addAddress($user_email, $user_name);

                $mail->isHTML(true);
                $mail->Subject = 'You Have Been Assigned a New Task';
                $mail->Body    = "
                    Hello <strong>$user_name</strong>,<br><br>
                    A new task has been assigned to you.<br><br>
                    <strong>Title:</strong> $title<br>
                    <strong>Description:</strong> $description<br>
                    <strong>Due Date:</strong> $due_date<br><br>
                    Please log in to your account to check the task.<br><br>
                    Regards,<br>
                    EdinaAdmin 🤗Task Management System
                ";

                $mail->send();
            } catch (Exception $e) {
                error_log("Email not sent: {$mail->ErrorInfo}");
                // Optional: you can add an alert for the admin that email failed
            }

            // Redirect with success message
            $em = "Task created successfully";
            header("Location: ../create_task.php?success=$em");
            exit();
        }

    } else {
        $em = "Unknown error occurred";
        header("Location: ../create_task.php?error=$em");
        exit();
    }

} else {
    $em = "First login";
    header("Location: ../create_task.php?error=$em");
    exit();
}
