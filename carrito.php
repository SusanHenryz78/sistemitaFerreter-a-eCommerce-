<?php
session_start();

require 'includes/db.php';

$carrito = isset($_SESSION['carrito']) ? $_SESSION['carrito'] : array();

if (!empty($carrito)) {
    $ids = implode(',', array_keys($carrito));
    $stmt = $conn->prepare("SELECT * FROM productos WHERE ID_producto IN ($ids)");
    $stmt->execute();
    $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $productos = array();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Carrito</h1>
    <div class="carrito">
        <?php if (!empty($productos)): ?>
            <ul>
                <?php foreach ($productos as $producto): ?>
                    <li>
                        <?php echo htmlspecialchars($producto['Nombre_producto']); ?>
                        - Cantidad: <?php echo htmlspecialchars($carrito[$producto['ID_producto']]); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>El carrito está vacío.</p>
        <?php endif; ?>
    </div>
</body>
</html>