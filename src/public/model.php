<?php

class Model
{
    public function getData(): array
    {
        // Data Source Name
        $dsn = "mysql:host=mysql;dbname=product_db;charset=UTF8;port=3306";

        // PHP Data Object - lightweight interface for accessing database
        $pdo = new PDO($dsn, "app", "secret", [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]);

        // Create a new statement to execute on the database
        $statement = $pdo->query("SELECT * FROM product");

        // Execute the statemtent and fetch all the results in an associative array
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}