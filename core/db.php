<?php
// require_once 'cis2360_dog_show_ok/core/01_config.php';
require_once __DIR__ . '/config.php';

function getConnection() {
    try {
        $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";


        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // better error handling
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // make fetching data from db make easier
            PDO::ATTR_EMULATE_PREPARES => false,  # prevents sql attacks 
        ];

        return new PDO($dsn, DB_USER, DB_PASS, $options);
    } catch (PDOException $e) {
        die("Database connection failed: " . $e->getMessage());
    }
}
?>