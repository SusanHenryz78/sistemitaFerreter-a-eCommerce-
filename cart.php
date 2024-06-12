<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$cart_items = [];
$total_price = 0;

if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $id => $quantity) {
        $query = $conn->prepare("SELECT * FROM productos WHERE ID_Producto = :id");
        $query->bindParam(':id', $id);
        $query->execute();
        $product = $query->fetch(PDO::FETCH_ASSOC);

        $product['quantity'] = $quantity;
        $cart_items[] = $product;
        $total_price += $product['Precio_producto'] * $quantity;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cart</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Shopping Cart</h1>
    <?php if (!empty($cart_items)): ?>
        <div class="cart">
            <?php foreach ($cart_items as $item): ?>
                <div class="cart-item">
                    <h2><?= htmlspecialchars($item['Nombre_producto']) ?></h2>
                    <p>Quantity: <?= htmlspecialchars($item['quantity']) ?></p>
                    <p>Price: $<?= htmlspecialchars($item['Precio_producto']) ?></p>
                </div>
            <?php endforeach; ?>
        </div>
        <h2>Total: $<?= $total_price ?></h2>
        <a href="checkout.php">Checkout</a>
    <?php else: ?>
        <p>Your cart is empty.</p>
    <?php endif; ?>
</body>
</html>