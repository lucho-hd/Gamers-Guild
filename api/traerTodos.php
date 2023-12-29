<?php header("Access-Control-Allow-Origin: *");

require 'conexion.php';

try {
    $conexion = DBConexion::getConexion();
    
    $query = "SELECT * FROM juegos ORDER BY id";
    $stm   = $conexion->prepare($query); 
    $stm->execute();

    $juegos = $stm->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($juegos);

} catch (PDOException $e) {
    echo json_encode(array ("error" => $e->getMessage()));
}
?>