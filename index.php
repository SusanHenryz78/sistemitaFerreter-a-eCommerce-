<?php
require 'includes/db.php';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ferretería E-commerce</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <h1>Productos Disponibles</h1>
    <div class="product-list">
        <?php
        $query = $conn->prepare("SELECT * FROM productos");
        $query->execute();
        $productos = $query->fetchAll(PDO::FETCH_ASSOC);

        foreach ($productos as $producto) {
            echo '<div class="product">';
            echo '<h2>' . $producto['Nombre_producto'] . '</h2>';
            echo '<p>' . $producto['Descripcion'] . '</p>';
            echo '<p>Precio: $' . $producto['Precio_producto'] . '</p>';
            echo '<p>Stock: ' . $producto['Cantidad'] . '</p>';
            echo '<form action="add_to_cart.php" method="post">';
            echo '<input type="hidden" name="ID_producto" value="' . $producto['ID_producto'] . '">';
            echo '<input type="submit" value="Agregar al carrito">';
            echo '</form>';
            echo '</div>';
        }
        ?>
    </div>
</body>
</html>
