<!DOCTYPE html>
<html lang='hr'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta name='author' content='Iva Papac'>
    <meta name='title' content='Početna stranica'>
    <meta name='description' content='Home design, usluge dizajna interijera'>
    <meta name='keywords' content='home design, dizajn interijera, modernizam'>
    <link rel='stylesheet' href='css/ipapac.css' type='text/css'>
    <link rel='stylesheet' href='css/ipapac_prilagodbe.css' type='text/css'>
    <link rel='stylesheet' href='css/ipapac_ispis.css' type='text/css'>
    <title>Početna stranica</title>
</head>
<body>
    <div>
        <header>
            <div class='logo-itm'>
                <a href='index.php'><img src='multimedija/logo.png' alt='Home Design logo'></a>
            </div>

            <div class='naslov-itm'>
                <h1>Home Design</h1>
                <h4>Let your dreams become reality</h4>
            </div>

            <form class='odjava-itm' method='GET' action='{$link}'>
                <button type='submit' name='odjava'>{$prijava}</button>
            </form>

            <div class='search-itm'>
                <form method='GET' action='http://barka.foi.hr/WebDiP/2019/materijali/zadace/ispis_forme.php'>
                    <input type='search' name='search' placeholder='Pretraži...'>
                    <button type='submit'><img src='multimedija/search.svg' alt='search-btn'></button>
                </form>
            </div>
        </header>

        <nav>
            <img src='multimedija/izbornik.svg' alt='Izbornik' usemap='#izbornikmap'>
            <map name='izbornikmap' class='img-map'>
                <area shape='rect' coords='0,0,303,28' alt='Registracija' href='obrasci/registracija.php'>
                <area shape='circle' coords='450,16,140' alt='Prijava' href='obrasci/prijava.php'>
                {if isset($admin)}<area shape='poly' coords='608,0,608,28,910,28,910,0' alt='Obrazac za dodavanje novog sadržaja' href='obrasci/obrazac.php'>{/if}
                {if isset($moderator)}<area shape='rect' coords='910,0,1062,28' alt='Multimedija' href='ostalo/multimedija.php'>{/if}
                {if isset($registrirani)}<area shape='rect' coords='1062,0,1215,28' alt='Popis' href='ostalo/popis.php'>{/if}
                <area shape='rect' coords='1215,0,1366,28' alt='Plan testa' href='plan.php'>
                <area shape='rect' coords='1366,0,1518,28' alt='Test brzine' href='testBrzine.php'>
            </map>
        </nav>

        <img src='multimedija/izbornik.svg' alt='Izbornik' class='izbornik'>
    </div>

    <div class='content'>
        <div class='poveznice'>
            <ul>
                <li><a href='index.php'>Početna</a></li>
                <li><a href='obrasci/registracija.php'>Registracija</a></li>
                <li><a href='obrasci/prijava.php'>Prijava</a></li>
                {if isset($admin)}<li><a href='obrasci/obrazac.php'>Obrazac</a></li>{/if}
                {if isset($moderator)}<li><a href='ostalo/multimedija.php'>Multimedija</a></li>{/if}
                {if isset($registrirani)}<li><a href='ostalo/popis.php'>Popis</a></li>{/if}
                <li><a href='plan.php'>Plan testa</a></li>
                <li><a href='testBrzine.php'>Test brzine</a></li>
            </ul>
        </div>

        <div class='grey-container'>
            <ul>
                <li><img src='multimedija/user.png' alt='profile-photo'></li>
                <li>Iva Papac</li>
                <li>email: ipapac@foi.hr</li>
                <li>JMBAG: 0016129565</li>
            </ul>

            <div class='images'>
                <img src='multimedija/interijer-1.jpg' alt='interijer-1'>
                <img src='multimedija/interijer-2.jpg' alt='interijer-2'>
                <img src='multimedija/interijer-3.jpg' alt='interijer-3'>
                <img src='multimedija/interijer-4.jpg' alt='interijer-4'>
                <img src='multimedija/interijer-5.jpg' alt='interijer-5'>
                <img src='multimedija/interijer-6.jpg' alt='interijer-6'>
                <img src='multimedija/interijer-7.jpg' alt='interijer-7'>
                <img src='multimedija/interijer-8.jpg' alt='interijer-8'>
                <img src='multimedija/interijer-9.jpg' alt='interijer-9'>
                <img src='multimedija/interijer-10.jpg' alt='interijer-10'>
            </div>
        </div>

        <div class='white-container'>

            <div class='clanak'>
                <article>
                    <h4>CVJETNI MOTIVI U KUPAONICI</h4>
                    <p>Vladavina uzoraka betona, mramora i drveta, cvjetni motivi ipak nije istisnula cvjetne motive,
                        koji su ionako najpopularniji motivi u povijesti kupaonica. Jedino što se mijenjalo su boje i stil. 
                        Cvjetni motivi lako se kombiniraju s jednobojnim pločicama, ali i onima koje imaju svoj uzorak. 
                        Cvjetovi su idealan način na naglasimo neki dio kupaonice, ili da prostor ne djeluje monotono.<br><br>
                        <a href='https://indizajn.rtl.hr/inspiracija/ideje-i-savjeti/cvjetni-motivi-u-kupaonici-sjajan-nacin-da-naglasite-dijelove-prostorije-i-unesete-prirodu-u-nju/'>Izvor: InDizajn</a>
                    </p>
                </article>
            </div>

            <div class='clanak'>
                <article>
                    <h4>KUHINJA MJESECA</h4>
                    <p>Starinske kuhinje imale su uglavnom koncept otvorenih polica na kojima je sve bilo “transparentno”. 
                        No, sa smanjenjem broja kvadrata ove prostorije u domu zaživjela je ideja zatvorenih ormarića 
                        u koje je stalo puno više stvari. 
                        A sada, najnoviji trendovi donose kuhinje koje ne samo da imaju u svom sastavu ormare od poda do stropa, 
                        bez “prekida” u srednjem dijelu koji bi dijelio elemente na donje i gornje, nego se one u potpunosti zatvaraju.
                        Naravno, nude i mogućnost da se vrlo lako i jednostavno otvaraju i zatvaraju. Možda će nam se to na prvu činiti 
                        posve nepotrebnim pa čak i nelogičnim, no skrivene kuhinje, koje imaju koncept vrata koja ih posve zatvaraju i 
                        pretvaraju u ugradbene ormare itekako je dobar i koristan.<br><br>
                        <a href='https://indizajn.rtl.hr/prostorije-doma/kuhinje/skrivene-kuhinje-su-u-trendu-kad-najtoplije-mjesto-u-domu-postane-nevidljivo/'>Izvor: InDizajn</a>
                    </p>
                </article>
            </div>

            <div class='clanak'>
                <article>
                    <h4>PROSTOR ISPOD KREVETA</h4>
                    <p>Iskoristiti krevet, odnosno prostor ispod njega svakako je poželjno, 
                        naročito ako imamo malu spavaonicu ili općenito živimo u životnom prostoru koji ne obiluje kvadratima. 
                        U njega pohranjujemo stvari poput popluna, deka i posteljine, stvari koje često ne koristimo 
                        kao i sezonsku odjeću i obuću koja trenutno nije aktualna. 
                        Dogodi se da tamo spremimo stvari kojima tamo nije mjesto te napravimo i nekoliko drugih “strateških” pogrešaka.<br><br>
                        <a href='https://indizajn.rtl.hr/prostorije-doma/spavace-sobe/prostor-ispod-kreveta-evo-u-cemu-najcesce-grijesite-prilikom-skladistenja-stvari-na-ovo-mjesto/'>Izvor: InDizajn</a> 
                    </p>
                </article>
            </div>
        </div>
    </div>