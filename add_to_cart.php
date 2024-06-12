<?php
session_start();
require 'db.php';

if (isset($_GET['id'])) {
    $productId = $_GET['id'];

    // Obtener información del producto
    $query = $conn->prepare("SELECT * FROM productos WHERE ID_Producto = :id");
    $query->bindParam(':id', $productId, PDO::PARAM_INT);
    $query->execute();
    $product = $query->fetch(PDO::FETCH_ASSOC);

    if ($product) {
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Agregar producto al carrito
        $_SESSION['cart'][] = $product;
    }
}

header('Location: index.php');
exit;
?>