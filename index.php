<?php
session_start();
require 'includes/db.php'; // Asegúrate de que esta ruta es correcta

// Obtener productos de la base de datos
$stmt = $conn->prepare("SELECT * FROM productos");
$stmt->execute();
$productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ferretería eCommerce</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Productos</h1>
    <div class="productos">
        <?php foreach ($productos as $producto): ?>
            <div class="producto">
                <h2><?php echo htmlspecialchars($producto['Nombre_producto']); ?></h2>
                <p><?php echo htmlspecialchars($producto['Descripcion']); ?></p>
                <p>Precio: $<?php echo htmlspecialchars($producto['Precio_producto']); ?></p>
                <form action="agregar_carrito.php" method="POST">
                    <input type="hidden" name="id_producto" value="<?php echo $producto['ID_producto']; ?>">
                    <button type="submit">Agregar al carrito</button>
                </form>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>