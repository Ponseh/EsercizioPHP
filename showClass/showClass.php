<?php
    require_once('..\database\database.php');

    $stmt = $conn->prepare('SELECT nomeclasse FROM tclassi WHERE speclasse=?');
    $stmt->bind_param("s", $_POST['Specializzazione']);
    $stmt->execute();
    $result = $stmt->get_result();

    $arrayRes = array();

    if (!($result->num_rows === 0)) {
        $i=0;
        while($row = $result->fetch_assoc()) {
            $arrayRes[$i] = $row;
            $i++;
        }
    }

    foreach ($arrayRes as $key => $value) {
        echo "<a href=\"showTeacher.php?nomeClasse={$value['nomeclasse']}\">{$value['nomeclasse']}</a>";
        echo "<br>";
    }

    $stmt->close();
?>
