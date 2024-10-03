<?php
include "./database.php";

try{
    $sql = "INSERT INTO users (username, email) VALUES ('manager', 'manager@mail.com');";
    $stmt = $pdo->prepare($sql);
    // Bind parameters
    // $stmt->bindParam(':username', $username);
    // $stmt->bindParam(':email', $email);

    // Example values
    // $username = 'john_doe';
    // $email = 'john@example.com';

    $stmt->execute();
    
    echo "Create user successful";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$pdo = null;
?>
