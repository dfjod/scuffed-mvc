<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Products</h1>
    <?php foreach ($products as $product): ?>
        <!-- htmlspecialschars escapes special characters in text to prevent XSS -->
        <h2><?= htmlspecialchars($product["name"])?></h2>
        <p><?= htmlspecialchars($product["description"])?></p>
    <?php endforeach; ?>
</body>
</html>