<?php
    $root = 'http://barka.foi.hr' . substr($_SERVER['REQUEST_URI'], 0, 30);

	include('vanjske_biblioteke/smarty/libs/Smarty.class.php');
    $smarty = new Smarty();
    
    include ('podnozje.php');
    include('vanjske_biblioteke/sesija.class.php');

    Sesija::kreirajSesiju();

    $uri = 'http://barka.foi.hr' . $_SERVER['REQUEST_URI'];

    $smarty->assign('uri', $uri);
    $smarty->assign('dir', $root);

    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] < 4) $smarty->assign('registrirani', true);
    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] < 3) $smarty->assign('moderator', true);
    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] == 1) $smarty->assign('admin', true);

    if(isset($_SESSION['korisnik'])){
        $smarty->assign('prijava', 'Odjava');
        $smarty->assign('link', '#');
    }
    else{
        $smarty->assign('prijava', 'Prijava');
        $smarty->assign('link', 'obrasci/prijava.php');
    }

    if(isset($_GET['odjava']) && isset($_SESSION['korisnik'])){
        Sesija::obrisiSesiju();
        header('Location: index.php');
    }

    $smarty->display('templates/index.tpl');
    $smarty->display('templates/podnozje.tpl');
?>