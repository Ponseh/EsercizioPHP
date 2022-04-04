<?php
    require_once('..\database\database.php');

    $stmt = $conn->prepare('SELECT nomeclasse FROM tclassi WHERE speclasse=?');
    $stmt->bind_param("s", $_POST['Specializzazione']);
    $result = $stmt->execute();

    $arrayRes = $result->fetch_assoc();
?>
