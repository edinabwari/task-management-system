<?php 
session_start();

if (isset($_POST['user_name']) && isset($_POST['email']) && isset($_POST['password'])) {
	include "../DB_connection.php";

    function validate_input($data) {
	  $data = trim($data);
	  $data = stripslashes($data);
	  $data = htmlspecialchars($data);
	  return $data;
	}

	$user_name = validate_input($_POST['user_name']);
	$email = validate_input($_POST['email']);
	$password = validate_input($_POST['password']);

	// It checks for empty spaces 
	if (empty($user_name)) {
		$em = "User name is required";
	    header("Location: ../login.php?error=" . urlencode($em));
	    exit();
	} else if (empty($email)) {
		$em = "Email is required";
	    header("Location: ../login.php?error=" . urlencode($em));
	    exit();
	} else if (empty($password)) {
		$em = "Password is required";
	    header("Location: ../login.php?error=" . urlencode($em));
	    exit();
	} else {

		// Prepare SQL securely
		$sql = "SELECT * FROM users WHERE username = ? AND email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$user_name, $email]);

        // If user found
        if ($stmt->rowCount() == 1) {
       	   $user = $stmt->fetch();
       	   $passwordDb = $user['password'];
       	   $role = $user['role'];
       	   $id = $user['id'];
		   $usernameDb = $user['username'];
		   $emailDb = $user['email'];

       	   // Check if username and email match
       	   if ($user_name === $usernameDb && $email === $emailDb) {
	       	   	if (password_verify($password, $passwordDb)) {
	       	   		// Login successful
	       	   		$_SESSION['role'] = $role;
	       	   		$_SESSION['id'] = $id;
	       	   		$_SESSION['username'] = $usernameDb;
	       	   		header("Location: ../index.php");
	       	   		exit();
	       	   	} else {
	       	   	   $em = "Incorrect password. Please try again.";
	       	   	   header("Location: ../login.php?error=" . urlencode($em));
	       	   	   exit();
	       	   	}
       	   } else {
       	   	   $em = "Username or email does not match our records.";
       	   	   header("Location: ../login.php?error=" . urlencode($em));
       	   	   exit();
       	   }
        } else {
        	// No such user in DB
        	$em = "No user found with the provided credentials.";
        	header("Location: ../login.php?error=" . urlencode($em));
        	exit();
        }
	}
} else {
   $em = "Invalid access. Please submit the login form.";
   header("Location: ../login.php?error=" . urlencode($em));
   exit();
}
