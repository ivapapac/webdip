<?php
    $dir = substr(getcwd(), 0, 50);
    $root = 'http://barka.foi.hr' . substr($_SERVER['REQUEST_URI'], 0, 30);
    $uri = 'http://barka.foi.hr' . $_SERVER['REQUEST_URI'];

    include($dir . '/vanjske_biblioteke/smarty/libs/Smarty.class.php');
    include($dir . '/vanjske_biblioteke/sesija.class.php');

    Sesija::kreirajSesiju();
    $smarty = new Smarty();
    $smarty->assign('dir', $root);
    $smarty->assign('uri', $uri);

    if(preg_match('/registracija.php/mi', $uri)){
        $smarty->assign('naslov', 'Registracija');
        $smarty->assign('registracija', true);
    }
    else if(preg_match('/prijava.php/mi', $uri)) $smarty->assign('naslov', 'Prijava');
    else if(preg_match('/obrazac.php/mi', $uri)) $smarty->assign('naslov', 'Dodaj sadržaj');
    else if(preg_match('/multimedija.php/mi', $uri)) $smarty->assign('naslov', 'Multimedija');
    else if(preg_match('/popis.php/mi', $uri)) $smarty->assign('naslov', 'Popis');
    else if(preg_match('/plan.php/mi', $uri)) $smarty->assign('naslov', 'Plan testa');
    else if(preg_match('/testBrzine.php/mi', $uri)) $smarty->assign('naslov', 'Test brzine');

    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] < 4) $smarty->assign('registrirani', true);
    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] < 3) $smarty->assign('moderator', true);
    if(isset($_SESSION['uloga']) && $_SESSION['uloga'] == 1) $smarty->assign('admin', true);

    if(isset($_SESSION['korisnik'])){
        $smarty->assign('prijava', 'Odjava');
        $smarty->assign('link', $root . 'index.php');
    }
    else{
        $smarty->assign('prijava', 'Prijava');
        $smarty->assign('link', $root . 'obrasci/prijava.php');
    }

    if(isset($_GET['odjava']) && isset($_SESSION['korisnik'])){
        Sesija::obrisiSesiju();
        header("Location: {$root}index.php");
    }
?>