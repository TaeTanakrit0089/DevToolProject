<?php
$host = getenv('DATABASE_HOST');
$dbname = getenv('DATABASE_NAME');
$user = getenv('DATABASE_USER');
$pass = getenv('DATABASE_PASSWORD');
$port = '5432';       // Default PostgreSQL port

try {
    // Create a new PDO connection
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,  // Enable exceptions on error
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC  // Fetch associative arrays by default
    ]);

    // Successful connection
    echo "Connected to PostgreSQL database successfully!";
} catch (PDOException $e) {
    // Handle any connection errors
    echo "Error connecting to PostgreSQL: " . $e->getMessage();
    exit;
}
?>