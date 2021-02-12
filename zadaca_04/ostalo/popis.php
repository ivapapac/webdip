<?php
    include ('../zaglavlje.php');
    include ('../podnozje.php');
    include('../proizvod.class.php');

    $proizvod = new Proizvod();

    if(!isset($_SESSION['uloga'])){
        header('Location: ../obrasci/prijava.php');
    }
    else if($_SESSION['uloga'] > 3){
        header('Location: ../index.php');
    }
    
    if(isset($_GET['search'])){
        $rezultat = $proizvod->DohvatiSveProizvode($_GET['search']);
        $smarty->assign('rezultat', '<p id="rezultat"> Rezultati pretraživanja za: "' . $_GET['search'] . '"</p><br>');
    }
    else{
        $rezultat = $proizvod->DohvatiSveProizvode();
    }

    $smarty->assign('tbody', $rezultat[0]);
    $smarty->assign('table', $rezultat[1]);


    $smarty->display('../templates/zaglavlje.tpl');
    $smarty->display('../templates/popis.tpl');
    $smarty->display('../templates/podnozje.tpl');
?>