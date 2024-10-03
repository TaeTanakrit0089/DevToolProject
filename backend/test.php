<?php
include "./database.php";
$sql = "SELECT * FROM users";
$stmt = $pdo->prepare($sql);

$stmt->execute();

$message = $stmt->fetchObject();

echo json_encode($message);

$pdo = null
?>