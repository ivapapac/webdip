<?php
    include('zaglavlje.php');
    include('podnozje.php');

    $smarty->display('templates/zaglavlje.tpl');
    $smarty->display('templates/plan.tpl');
    $smarty->display('templates/podnozje.tpl');
?>
