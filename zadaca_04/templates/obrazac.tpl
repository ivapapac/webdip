<div class='obrazac'>
    <form novalidate enctype='multipart/form-data' class='obrazac-sadrzaj' method='POST' action={$uri2}>
        <p class='uspjeh'>{if isset($poruka)}{$poruka}{/if}</p>
        <h3>Informacije o proizvodu</h3>
        <label for='name'>Naziv</label><br>
        <input type='text' id='name' name='naziv' required
        {if isset($naziv)}{$naziv}{/if} {if isset($value1) && !isset($smarty.post.naziv)}value='{$value1}'{/if}
        {if isset($smarty.post.naziv)}value='{$smarty.post.naziv}'{/if}><br>
        <label for='boja'>Boja</label><br>
        <input type='color' id='boja' name='boja' required
        {if isset($boja)}{$boja}{/if} {if isset($value2) && !isset($smarty.post.boja)}value='{$value2}'{/if}
        {if isset($smarty.post.boja)}value='{$smarty.post.boja}'{/if}><br>
        <label for='kvaliteta'>Kvaliteta (0-10)</label><br>
        <input type='range' id='kvaliteta' min='0' max='10' name='kvaliteta' required
        {if isset($kvaliteta)}{$kvaliteta}{/if} {if isset($value3) && !isset($smarty.post.kvaliteta)}value='{$value3}'{/if}
        {if isset($smarty.post.kvaliteta)}value='{$smarty.post.kvaliteta}'{/if}><br>

        <label>Prostorija namjene</label>
        <div {if isset($prostorija)}{$prostorija}{/if}>
        <div class='odabir-prostorije'>
            <input type='radio' id='dnevna-soba' value='Dnevna soba' name='prostorija'
            {if isset($dnevna)}{literal}checked{/literal}{/if}>
            <label for='dnevna-soba'>Dnevna soba</label>
            <input type='radio' id='kuhinja' value='Kuhinja' name='prostorija'
            {if isset($kuhinja)}{literal}checked{/literal}{/if}>
            <label for='kuhinja'>Kuhinja</label>
            <input type='radio' id='spavaca-soba' value='Spavaća soba' name='prostorija'
            {if isset($spavaca)}{literal}checked{/literal}{/if}>
            <label for='spavaca-soba'>Spavaća soba</label>
            <input type='radio' id='djecja-soba' value='Dječja soba' name='prostorija'
            {if isset($djecja)}{literal}checked{/literal}{/if}>
            <label for='djecja-soba'>Dječja soba</label>
            <input type='radio' id='kupaonica' value='Kupaonica' name='prostorija'
            {if isset($kupaonica)}{literal}checked{/literal}{/if}>
            <label for='kupaonica'>Kupaonica</label>
            <input type='radio' id='hodnik' value='Hodnik' name='prostorija'
            {if isset($hodnik)}{literal}checked{/literal}{/if}>
            <label for='hodnik'>Hodnik</label><br>
        </div>
        </div>

        <label>Vrsta</label>
        <div {if isset($vrsta)}{$vrsta}{/if}>
        <div class='odabir-vrste'>
            <input type='checkbox' id='namjestaj' value='Namještaj' name='vrsta[]'
            {if isset($namjestaj)}{literal}checked{/literal}{/if}>
            <label for='namjestaj'>Namještaj</label>
            <input type='checkbox' id='dom' value='Dom' name='vrsta[]'
            {if isset($dom)}{literal}checked{/literal}{/if}>
            <label for='dom'>Dom</label>
            <input type='checkbox' id='rasvjeta' value='Rasvjeta' name='vrsta[]'
            {if isset($rasvjeta)}{literal}checked{/literal}{/if}>
            <label for='rasvjeta'>Rasvjeta</label>
            <input type='checkbox' id='tepih' value='Tepisi i staze' name='vrsta[]'
            {if isset($tepisi)}{literal}checked{/literal}{/if}>
            <label for='tepih'>Tepisi i staze</label>
            <input type='checkbox' id='kreveti' value='Kreveti' name='vrsta[]'
            {if isset($kreveti)}{literal}checked{/literal}{/if}>
            <label for='kreveti'>Kreveti</label>
            <input type='checkbox' id='stol' value='Stol i stolice' name='vrsta[]'
            {if isset($stol)}{literal}checked{/literal}{/if}>
            <label for='stol'>Stol i stolice</label>
            <input type='checkbox' id='ukrasi' value='Ukrasi' name='vrsta[]'
            {if isset($ukrasi)}{literal}checked{/literal}{/if}>
            <label for='ukrasi'>Ukrasi</label>
            <input type='checkbox' id='ormari' value='Ormari' name='vrsta[]'
            {if isset($ormari)}{literal}checked{/literal}{/if}>
            <label for='ormari'>Ormari</label>
        </div>
        </div>

        <input type='hidden' name='MAX_FILE_SIZE' value='5000000'/>
        <label for='slika'>Prenesi sliku</label><br>
        <input type='file' id='slika' name='slika' accept='image/*' required {if isset($slika)}{$slika}{/if}/>
        {if isset($value8)}{$value8}{/if}

        <h3>Informacije o kupnji</h3>
        <label for='link-kupnja'>Poveznica za kupnju</label><br>
        <input type='url' id='link-kupnja' name='link' required
        {if isset($link)}{$link}{/if} {if isset($value4) && !isset($smarty.post.link)}value='{$value4}'{/if}
        {if isset($smarty.post.link)}value='{$smarty.post.link}'{/if}><br>
        <label for='dostupno-do'>Dostupno do</label><br>
        <input type='datetime-local' id='dostupno-do' name='dostupnost' required
        {if isset($dostupnost)}{$dostupnost}{/if} {if isset($value7) && !isset($smarty.post.dostupnost)}value='{$value7}'{/if}
        {if isset($smarty.post.dostupnost)}value='{$smarty.post.dostupnost}'{/if}><br>
        <label for='cijena'>Cijena</label><br>
        <select id='cijena' multiple name='cijena[]' required {if isset($cijena)}{$cijena}{/if}>
            <option {if isset($cijena1)}{literal}selected{/literal}{/if}
            value='0 - 500 HRK'>0 - 500 HRK</option>
            <option {if isset($cijena2)}{literal}selected{/literal}{/if}
            value='500 - 1000 HRK'>500 - 1000 HRK</option>
            <option {if isset($cijena3)}{literal}selected{/literal}{/if}
            value='1000 - 1500 HRK'>1000 - 1500 HRK</option>
            <option {if isset($cijena4)}{literal}selected{/literal}{/if}
            value='1500 - 2000 HRK'>1500 - 2000 HRK</option>
            <option {if isset($cijena5)}{literal}selected{/literal}{/if}
            value='2000 - 5000 HRK'>2000 - 5000 HRK</option>
            <option {if isset($cijena6)}{literal}selected{/literal}{/if}
            value='5000 - 10000 HRK'>5000 - 10000 HRK</option>
        </select><br>
        <label for='kontakt'>Kontakt</label><br>
        <input type='tel' id='kontakt' name='kontakt' required
        {if isset($kontakt)}{$kontakt}{/if} {if isset($value5) && !isset($smarty.post.kontakt)}value='{$value5}'{/if}
        {if isset($smarty.post.kontakt)}value='{$smarty.post.kontakt}'{/if}><br>
        <label for='dostava'>Tjedan dostave</label><br>
        <input type='week' id='dostava' name='dostava' required
        {if isset($dostava)}{$dostava}{/if} {if isset($value6) && !isset($smarty.post.dostava)}value='{$value6}'{/if}
        {if isset($smarty.post.dostava)}value='{$smarty.post.dostava}'{/if}><br>

        {if isset($greska)}
        <p class='ispis-greske'>{$greska}</p>
        {/if}

        <button type='submit' name='submit'>SPREMI</button>
    </form>
</div>

{if isset($podaci)}{$podaci}{/if}
