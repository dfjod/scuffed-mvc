<?php

require __DIR__ . '../../vendor/autoload.php';
require "../controllers/products.php";

$controller = new Products;
$controller->index();