<?php

require __DIR__ . '../../vendor/autoload.php';

// Front controller
require "../src/controllers/products.php";

$controller = new Products;

$action = $_GET["action"];

if ($action === "index") {
    $controller->index();
}

if ($action === "show") {
    $controller->show();
}