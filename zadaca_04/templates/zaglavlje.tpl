<!DOCTYPE html>
<html lang='hr'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta name='author' content='Iva Papac'>
    <meta name='title' content='{$naslov}'>
    <meta name='description' content='Home design, usluge dizajna interijera'>
    <meta name='keywords' content='home design, dizajn interijera, modernizam'>
    <link rel='stylesheet' href='{$dir}css/ipapac.css' type='text/css'>
    <link rel='stylesheet' href='{$dir}css/ipapac_prilagodbe.css' type='text/css'>
    <link rel='stylesheet' href='{$dir}css/ipapac_ispis.css' type='text/css'>
    {if isset($registracija)}<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
    <script src='//code.jquery.com/jquery-1.12.4.js'></script>
    <script src='{$dir}javascript/registracija.js'></script>{/if}
    <title>{$naslov}</title>
</head>

<body>
    <div>
        <header>
            <div class='logo-itm'>
                <a href='{$dir}index.php'><img src='{$dir}multimedija/logo.png' alt='Home Design logo'></a>
            </div>

            <div class='naslov-itm'>
                <h1>{$naslov}</h1>
                <h4>Let your dreams become reality</h4>
            </div>

            <form class='odjava-itm' method='GET' action='{$link}'>
                <button name='odjava'>{$prijava}</button>
            </form>

            <div class='search-itm'>
                <form method='GET' action='http://barka.foi.hr/WebDiP/2019/materijali/zadace/ispis_forme.php'>
                    <input type='search' placeholder='Pretraži...' name='search'>
                    <button type='submit'><img src='{$dir}multimedija/search.svg' alt='search-btn'></button>
                </form>
            </div>
        </header>

        <img src='{$dir}multimedija/izbornik.svg' alt='Izbornik'>

        <ul class='navigacija'>
            <li><a href='{$dir}index.php'>Početna</a></li>
            <li><a href='{$dir}obrasci/registracija.php'>Registracija</a></li>
            <li><a href='{$dir}obrasci/prijava.php'>Prijava</a></li>
            {if isset($admin)}<li><a href='{$dir}obrasci/obrazac.php'>Obrazac</a></li>{/if}
            {if isset($moderator)}<li><a href='{$dir}ostalo/multimedija.php'>Multimedija</a></li>{/if}
            {if isset($registrirani)}<li><a href='{$dir}ostalo/popis.php'>Popis</a></li>{/if}
            <li><a href='{$dir}plan.php'>Plan testa</a></li>
            <li><a href='{$dir}testBrzine.php'>Test brzine</a></li>
        </ul>
    </div>

