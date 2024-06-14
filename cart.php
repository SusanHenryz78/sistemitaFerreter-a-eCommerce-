<?php
session_start();
require 'includes/db.php'; // Asegúrate de que la ruta es correcta

// Inicializar carrito si no existe
if (!isset($_SESSION['carrito'])) {
    $_SESSION['carrito'] = array();
}

// Obtener detalles del carrito
$carrito = $_SESSION['carrito'];
$productos_en_carrito = [];

if (!empty($carrito)) {
    $ids_productos = array_keys($carrito);
    $placeholders = implode(',', array_fill(0, count($ids_productos), '?'));
    $stmt = $conn->prepare("SELECT * FROM productos WHERE ID_producto IN ($placeholders)");
    $stmt->execute($ids_productos);
    $productos_en_carrito = $stmt->fetchAll(PDO::FETCH_ASSOC);
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

    <h1>Carrito de Compras</h1>
    <div class="carrito">
        <?php if (empty($productos_en_carrito)): ?>
            <p>El carrito está vacío.</p>
        <?php else: ?>
            <ul>
                <?php foreach ($productos_en_carrito as $producto): ?>
                    <li>
                        <?php echo htmlspecialchars($producto['Nombre_producto']); ?> - 
                        Cantidad: <?php echo htmlspecialchars($carrito[$producto['ID_producto']]); ?> - 
                        Precio: $<?php echo htmlspecialchars($producto['Precio_producto']); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
            <form action="checkout.php" method="POST">
                <button type="submit">Proceder al Pago</button>
            </form>
        <?php endif; ?>
    </div>
</body>
</html>