<?php
    include ('../zaglavlje.php');
    include ('../podnozje.php');

    if(!isset($_SESSION['uloga'])){
        header('Location: ../obrasci/prijava.php');
    }
    else if($_SESSION['uloga'] > 2){
        header('Location: ../index.php');
    }

    $smarty->display('../templates/zaglavlje.tpl');
    $smarty->display('../templates/multimedija.tpl');
    $smarty->display('../templates/podnozje.tpl');
?>