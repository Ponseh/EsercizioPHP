<!DOCTYPE html>
<html lang="it" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title></title>
        <?php
            session_start();


            if(isset($_POST["no"])){
                header("Location: deleteTeacher.html");
            }else if(isset($_POST["yes"])){
                header("Location: deleteTeacher.php");
            }else{
                $_SESSION['Nome_Insegnante'] = $_POST['Nome_Insegnante'];
                $_SESSION['Cognome_Insegnante'] = $_POST['Cognome_Insegnante'];
            }
        ?>
    </head>
    <body>
        <h1 style="color:red;">Sei sicuro?</h1>
        <form method="POST">
            <input type="submit" name="no" value="No">
            <input type="submit" name="yes" value="Sì">
        </form>
    </body>
</html>
