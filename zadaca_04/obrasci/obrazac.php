<?php
    include('../proizvod.class.php');
    include ('../zaglavlje.php');
    include ('../podnozje.php');

    $proizvod = new Proizvod();

    if(!isset($_SESSION['uloga'])){
        header('Location: ../obrasci/prijava.php');
    }
    else if($_SESSION['uloga'] > 1){
        header('Location: ../index.php');
    }

    $izbrisiSliku = '';
    $uri = $_SERVER['REQUEST_URI'];
    $smarty->assign('uri2', $uri);

    if(preg_match('/\?id=/i', $uri)){
        $id = substr($uri, strpos($uri, '=') + 1, strlen($uri));
        list($id, $naziv, $boja, $kvaliteta, $prostorija, $vrsta, $slika, $poveznica, $dostupnost,
        $cijena, $kontakt, $dostava) = $proizvod->DohvatiProizvod($id);

        $dostupnost[strpos($dostupnost, ' ')] = 'T';

        $smarty->assign('value1', $naziv);
        $smarty->assign('value2', $boja);
        $smarty->assign('value3', $kvaliteta);
        $smarty->assign('value4', $poveznica);
        $smarty->assign('value5', $kontakt);
        $smarty->assign('value6', $dostava);
        $smarty->assign('value7', $dostupnost);

        $smarty->assign('value8', "<img src='../multimedija/$slika' alt='Slika ne postoji'>");
        $izbrisiSliku = '/var/www/WebDiP/2019/zadaca_04/ipapac/multimedija/' . $slika;

        if($prostorija == 'Dnevna soba') $smarty->assign('dnevna', true);
        else if($prostorija == 'Kuhinja') $smarty->assign('kuhinja', true);
        else if($prostorija == 'Spavaća soba') $smarty->assign('spavaca', true);
        else if($prostorija == 'Dječja soba') $smarty->assign('djecja', true);
        else if($prostorija == 'Kupaonica') $smarty->assign('kupaonica', true);
        else if($prostorija == 'Hodnik') $smarty->assign('hodnik', true);

        if(preg_match('/namještaj/mi', $vrsta)) $smarty->assign('namjestaj', true);
        if(preg_match('/dom/mi', $vrsta)) $smarty->assign('dom', true);
        if(preg_match('/rasvjeta/mi', $vrsta)) $smarty->assign('rasvjeta', true);
        if(preg_match('/tepisi/mi', $vrsta)) $smarty->assign('tepisi', true);
        if(preg_match('/kreveti/mi', $vrsta)) $smarty->assign('kreveti', true);
        if(preg_match('/stol/mi', $vrsta)) $smarty->assign('stol', true);
        if(preg_match('/ukrasi/mi', $vrsta)) $smarty->assign('ukrasi', true);
        if(preg_match('/ormari/mi', $vrsta)) $smarty->assign('ormari', true);

        if(preg_match('/^0 - 500/mi', $cijena)) $smarty->assign('cijena1', true);
        if(preg_match('/^500 - 1000/mi', $cijena)) $smarty->assign('cijena2', true);
        if(preg_match('/^1000 - 1500/mi', $cijena)) $smarty->assign('cijena3', true);
        if(preg_match('/^1500 - 2000/mi', $cijena)) $smarty->assign('cijena4', true);
        if(preg_match('/^2000 - 5000/mi', $cijena)) $smarty->assign('cijena5', true);
        if(preg_match('/^5000 - 10000/mi', $cijena)) $smarty->assign('cijena6', true);
    }
    else {
        $smarty->assign('namjestaj', true);
        $smarty->assign('dom', true);
    }

    if(isset($_POST['submit'])){
        $greska = '';
        $css = 'class="greska"';

        if(!isset($_POST['prostorija'])) $_POST['prostorija'] = array();
        if(!isset($_POST['vrsta'])) $_POST['vrsta'] = array();
        if(!isset($_POST['cijena'])) $_POST['cijena'] = array();

        foreach ($_POST as $key => $value) {
            if (empty($value) && $key !== 'submit'){
                $greska .= 'Polje ' . $key . ' ne smije biti prazno <br>';
                $smarty->assign($key, $css);
            }
            else if($key === 'kontakt'){
                if(!(strlen($value) <= 14 && ($value[0] == '+' || ($value[0] == 0 && $value[1] == 0)) && is_numeric($value))){
                    $greska .= 'Unijeli ste neispravan telefonski broj <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key === 'link'){
                $regexp = '/^(https?:\/\/[^\.](\w+\.\w+)+|www\.\w+(\.\w+)*)(\.hr|\.com|\.org)$/i';
                if(preg_match($regexp, $value) == false){
                    $greska .= 'Unijeli ste neispravnu poveznicu <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key === 'vrsta'){
                $count = count($value);

                if($count < 2){
                    $greska .= 'Odaberite najmanje dvije vrste namještaja <br>';
                    $smarty->assign($key, $css);
                }
            }
            else if($key === 'cijena'){
                $count = count($value);

                if($count < 2){
                    $greska .= 'Odaberite najmanje dvije opcije cijene <br>';
                    $smarty->assign($key, $css);
                }
            }
        }

        $poruka = $proizvod->PohraniSliku($_FILES['slika']);
        if(!empty($poruka)){
            $greska .= $poruka . '<br>';
        }

        if (empty($greska)){
            $id = $proizvod->UnesiProizvod($uri);
            if(!empty($izbrisiSliku)) unlink($izbrisiSliku);
            $smarty->assign('poruka', 'Proizvod uspješno unesen!');
        }
        else{
            $smarty->assign('greska', $greska);
        }
    }

    $smarty->display('../templates/zaglavlje.tpl');
    $smarty->display('../templates/obrazac.tpl');
    $smarty->display('../templates/podnozje.tpl');
?>