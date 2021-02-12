<div class='popis'>
    <form class='search-table' method='GET' action='../ostalo/popis.php'>
        <input type='search' placeholder='Pretraži tablicu' name='search'>
        <button type='submit'>Traži</button>
    </form>

    {if isset($rezultat)}
        {$rezultat}
    {/if}

    <table id='popis-proizvoda'>
        <caption>Popis proizvoda</caption>
        <thead>
            <tr>
                <th>ID</th>
                <th>Naziv</th>
                <th>Boja</th>
                <th>Kvaliteta</th>
                <th>Vrsta</th>
                <th>Prostorija</th>
                <th>Slika</th>
                <th>Poveznica</th>
                <th>Dostupno do</th>
                <th>Cijena</th>
                <th>Kontakt</th>
                <th>Tjedan dostave</th>
                <th>Ažuriranje</th>
            </tr>
        </thead>

        <tbody>
            {$tbody}
        </tbody>
    </table>

    <table id='popis-mobitel'>
        <caption>Popis proizvoda</caption>
        {$table}
    </table>
</div>