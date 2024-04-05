<?php
session_start();

$conn= mysqli_connect('localhost','root','','phptest');

// Get user input
$username = $_POST['username'];
$password = $_POST['password'];//Password is stored as hash in db 

// Query the database for the user
$query = "SELECT * FROM users WHERE username = '$username'";
$result = mysqli_query($conn, $query);

// Check if the user exists
if ($result && mysqli_num_rows($result) > 0) { 
    $user = mysqli_fetch_assoc($result);
    
    // Verify password, compare hashed values
    if (password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        header('Location: dashboard.php');
        exit();
    } else {
        echo "Invalid password";
    }
} else {
    echo "User not found";
}