-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2020 at 02:35 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 7.2.25-1+0~20191128.32+debian8~1.gbp108445

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebDiP2019x092`
--

-- --------------------------------------------------------

--
-- Table structure for table `Dijete`
--

CREATE TABLE `Dijete` (
  `dijete_id` int(11) NOT NULL,
  `oib` char(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datum_rodenja` date NOT NULL,
  `potvrda_koristenja` tinyint(1) NOT NULL,
  `roditelj` int(11) NOT NULL,
  `skupina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dijete`
--

INSERT INTO `Dijete` (`dijete_id`, `oib`, `ime`, `prezime`, `datum_rodenja`, `potvrda_koristenja`, `roditelj`, `skupina`) VALUES
(1, '15941949421', 'Noa', 'Anić', '2015-12-03', 1, 2, 1),
(2, '13243118288', 'Ana', 'Anić', '2017-09-11', 1, 2, 5),
(3, '52592396141', 'Marko', 'Horvat', '2018-04-15', 1, 3, 2),
(4, '66858762446', 'Luka', 'Horvat', '2018-04-15', 1, 3, 2),
(5, '90157691039', 'Lucija', 'Lekić', '2017-08-20', 0, 4, 3),
(6, '23617676356', 'Lana', 'Lekić', '2016-02-17', 0, 4, 4),
(7, '61160848747', 'Juraj', 'Horvat', '2018-11-10', 0, 5, 6),
(8, '14685745073', 'Andrija', 'Horvat', '2016-05-06', 0, 5, 5),
(9, '56368516164', 'Fran', 'Mamić', '2015-12-07', 1, 6, 8),
(10, '81861959733', 'Iva', 'Mamić', '2017-11-20', 1, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Dječji vrtić`
--

CREATE TABLE `Dječji vrtić` (
  `vrtic_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `adresa` text NOT NULL,
  `broj_telefona` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `moderator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dječji vrtić`
--

INSERT INTO `Dječji vrtić` (`vrtic_id`, `naziv`, `adresa`, `broj_telefona`, `email`, `moderator`) VALUES
(1, 'Tratinčica', 'Trg podravskih heroja 7, 48000 Koprivnica', '048621358', 'vrtic.tratincica@gmail.com', 7),
(2, 'Bubamara', 'Trg kralja Zvonimira 32, 48000 Koprivnica', '048523698', 'bubamara_vrtic@gmail.com', 8),
(3, 'Smiješak', 'Starogradska ulica 22, 48000 Koprivnica', '048551236', 'djecjivrtic_smijesak@gmail.com', 9),
(4, 'Igra', 'Ulica kneza Domagoja 97, 48000 Koprivnica', '048225361', 'vrtic.igra@gmail.com', 10),
(5, 'Sunce', 'Ulica Augusta Šenoe 24, 48000 Koprivnica', '048752177', 'vrtic_sunce@gmail.com', 11),
(6, 'Vjeverica', 'Trg žrtava fašizma 21, 48000 Koprivnica', '048221258', 'vrtic.vjeverica@gmail.com', 12),
(7, 'Leptir', 'Varaždinska cesta 2, 48000 Koprivnica', '048638508', 'vrtic_leptir@gmail.com', 13),
(8, 'Loptica', 'Trg podravskih heroja 10, 48000 Koprivnica', '048215365', 'loptica_djeca@gmail.com', 14),
(9, 'Bumbar', 'Kolodvorska ulica 30, 48000 Koprivnica', '048217361', 'djecjivrtic.bumbar@gmail.com', 15),
(10, 'Crvenkapica', 'Ulica Antuna Nemčića Gostovinskog 14, 48000 Koprivnica', '048563794', 'vrtic_crvenkapica@gmail.com', 16);

-- --------------------------------------------------------

--
-- Table structure for table `Dnevnik rada`
--

CREATE TABLE `Dnevnik rada` (
  `datum_vrijeme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `korisnik` int(11) NOT NULL,
  `tip_akcije` int(11) NOT NULL,
  `opis` text NOT NULL,
  `upit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dnevnik rada`
--

INSERT INTO `Dnevnik rada` (`datum_vrijeme`, `korisnik`, `tip_akcije`, `opis`, `upit`) VALUES
('2020-04-03 12:18:42', 1, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:18:42', 2, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:23:20', 3, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:23:20', 2, 2, 'Korisnik pregledava dolaske djeteta.', 'SELECT * FROM `Evidencija dolazaka` WHERE `Evidencija dolaza`.dijete == Dijete.dijete_id AND Dijete.ime == "Ana" AND Dijete.prezime == "Anić";'),
('2020-04-03 12:28:55', 4, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:28:55', 5, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:29:15', 2, 1, 'Korisnik se odjavio iz sustava.', '-'),
('2020-04-03 12:30:29', 7, 1, 'Korisnik se prijavio u sustav.', '-'),
('2020-04-03 12:30:29', 5, 2, 'Korisnik pregledava dječje vrtiće.', 'SELECT * FROM `Dječji vrtić`;'),
('2020-04-03 12:31:33', 4, 2, 'Korisnik se pregledava račune.', 'SELECT * FROM Računi;');

-- --------------------------------------------------------

--
-- Table structure for table `Evidencija dolazaka`
--

CREATE TABLE `Evidencija dolazaka` (
  `datum` date NOT NULL,
  `dijete` int(11) NOT NULL,
  `dolazak` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Evidencija dolazaka`
--

INSERT INTO `Evidencija dolazaka` (`datum`, `dijete`, `dolazak`) VALUES
('2020-04-02', 1, 1),
('2020-04-02', 2, 1),
('2020-04-02', 3, 1),
('2020-04-02', 4, 0),
('2020-04-02', 5, 0),
('2020-04-02', 6, 1),
('2020-04-02', 7, 1),
('2020-04-02', 8, 1),
('2020-04-02', 9, 1),
('2020-04-02', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE `Korisnik` (
  `korisnik_id` int(11) NOT NULL,
  `oib` char(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datum_rodenja` date NOT NULL,
  `adresa` text NOT NULL,
  `broj_mobitela` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `korisnicko_ime` varchar(45) NOT NULL,
  `lozinka` varchar(20) NOT NULL,
  `lozinka_sha1` char(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `uvjeti` datetime NOT NULL,
  `aktivacijski_link` char(40) NOT NULL,
  `vrsta_korisnika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`korisnik_id`, `oib`, `ime`, `prezime`, `datum_rodenja`, `adresa`, `broj_mobitela`, `email`, `korisnicko_ime`, `lozinka`, `lozinka_sha1`, `status`, `uvjeti`, `aktivacijski_link`, `vrsta_korisnika`) VALUES
(1, '29138504616', 'Iva', 'Papac', '1998-04-07', 'Trg kralja Tomislava 1, 48000 Koprivnica', '0992583694', 'ipapac@gmail.com', 'ipapac', 'Jrx5NByhms', '3eae8cd776340f9f055546938432f1970e4ba3df', 1, '2020-04-01 10:00:00', 'c8bd5003b83911c3a7461da28e0c1fb3958e6186', 1),
(2, '97516031518', 'Vedran', 'Anić', '1964-04-22', 'Opatička ulica 7, 48000 Koprivnica', '0915478963', 'vedran.anic@gmail.com', 'vanic', 'FL7nJW9JMhdFD', '77d40f8a925bde2adfa23443fe49ca49ee87f2ad', 1, '2020-04-02 12:00:00', '69dc2f2878ba22e7693813e507d7273ebc90b0ee', 3),
(3, '30081226510', 'Mario', 'Horvat', '1970-04-23', 'Križevačka ulica 24, 48000 Koprivnica', '0912587364', 'mario.horvat@gmail.com', 'mhorvat', 'nekXtu5g8nBFU2E', '240e4888e1eaf1d74942f09de19884e3949d6ae4', 1, '2020-04-02 10:00:00', '20b2718cc9dbf4b32d495639ae92390707a8457c', 3),
(4, '82424227725', 'Jasminka', 'Lekić', '1975-07-18', 'Trg kralja Zvonimira 10, 48000 Koprivnica', '0998563257', 'jasminka_lekic@gmail.com', 'jlekic', 'VqUXcdtECck6fSR', '066bcfad5b36e8f17bf6ea75948c3ed80fbba237', 1, '2020-04-02 15:00:00', 'd54f46a5f07df79f5192d1804d30ab1ea9570bec', 3),
(5, '77979796426', 'Martin', 'Horvat', '1980-04-17', 'Trg kralja Tomislava 10, 48000 Koprivnica', '0982236471', 'martin.horvat@gmail.com', 'martin.horvat', 'SFPyjznyY46reFb', 'a893faece5184a667e6e31eff604bf675005aa31', 1, '2020-04-02 12:00:00', '200c150f6054decb6a92d05deeb12e866b7d0899', 3),
(6, '47514909223', 'Lucija', 'Mamić', '1972-10-24', 'Kolodvorska ulica 18, 48324 Koprivnički Bregi', '0998563214', 'lucmamic@gmail.com', 'lucmamic', '9SjXjhgE7bwnfrJ', '39be5fdf599bc7db97365639d88d51f26d7e92a0', 1, '2020-04-02 15:00:00', '505f30332fb30e85ca7becfe0a46b315d49e8567', 3),
(7, '34391206907', 'Ksenija', 'Potok', '1990-04-15', 'Miklinovec 70, 48000 Koprivnica', '0995362147', 'kpotok@gmail.com', 'kpotok', 'w4RPPr4bPME3ZGG', 'c8858ec7a68a2840ac5ea3435be3afbbaf60235f', 1, '2020-04-02 16:00:00', '956328d2fd42f2481eeff7d98d5bdaf1bc910468', 2),
(8, '67632136049', 'Ljubica', 'Zubčić', '1968-04-20', 'Ulica MIhovila Pavleka Miškine 4, 48000 Koprivnica', '0998563587', 'ljubica.zubcic@gmail.com', 'ljzubcic', 'XNGH68rdtAmeeEE', 'b830595aa8d6375fc6a9b148de4bf49e730320db', 1, '2020-04-02 13:00:00', '4b28d2187df759e9487fdaaccede108769eaafd1', 2),
(9, '90570005283', 'Luka', 'Vrkić', '1980-11-25', 'Vinogradska ulica 7, 48324 Koprivnički Bregi', '0912578635', 'vrkic.luka@gmail.com', 'luka_vrkic', 'XcT58chgDf5vJ8e', '126fc26a1240b33f6727802e51e403558c64b9a0', 1, '2020-04-02 15:00:00', '7dd0febc6c75a6ce0d9a4ecf452cc2eea1229367', 2),
(10, '47845449824', 'Anita', 'Ilić', '1966-02-17', 'Ulica doktora Željka Selingera 11, 48000 Koprivnica', '0998563251', 'anita.ilic@gmail.com', 'ailic', 'cWjzn8znvFp8vVt', '04a842657ebb3901ab84bca25c6d90bfe2abe892', 1, '2020-04-02 08:00:00', '8896d2da9d1161dd03503de074555e19f9469772', 2),
(11, '83149732952', 'Elena', 'Markotić', '1982-05-27', 'Ulica Tome Blažeka 22, 48000 Koprivnica', '09995321778', 'emarkotic@gmail.com', 'emarkotic', '5ws8cZ6aY2Vw6vx', '0055b390789db20830e3d053187531583a70f8cf', 1, '2020-04-02 17:00:00', '2a0cfa75321f2c9e01069217e5e54674fc2bbb47', 2),
(12, '97178559768', 'Miroslav', 'Blažek', '1964-11-15', 'Zagrebačka ulica 37, 48000 Koprivnica', '0995221126', 'miroslavblazek@gmail.com', 'mblazek', 'nn9L7xL8t2wgTHB', 'dc498f7838c8aa9c6f4df20823b267963da8c01c', 1, '2020-04-02 09:00:00', 'ad9fef8a0ff01bc58eb84e1392bc362e5d05ab26', 2),
(13, '48300221078', 'Ivana', 'Ševagović', '1991-05-06', 'Dravka ulica 11, 48000 Koprivnica', '0995336412', 'ivana_sevagovic@gmail.com', 'isevagovic', '7c6qfUuQ4GcFa8U', '68819799aab423991539a78142010f41512cb9bb', 1, '2020-04-02 14:00:00', 'b9915c6936cc58dd5b6674b154dfc4dad02bf275', 2),
(14, '86922410119', 'Petra', 'Samoborec', '1983-04-29', 'Ulica Augusta Šenoe 1, 48324 Koprivnički Bregi', '0912544789', 'psamoborec@gmail.com', 'psamoborec', 'H8H2YcANUF6VbJr', '6d6acae090d9a5cac1ed1bdcd98bf4208efbdee1', 1, '2020-04-02 15:00:00', 'c9e1b25b5afb8420820ed69ff70e1eb9f32726ea', 2),
(15, '8482726629', 'Katarina', 'Jembrek', '1974-12-07', 'Ulica Tina Ujecića 17, 48000 Koprivnica', '0985556324', 'katarina.jembrek@gmail.com', 'kjembrek', 'Cn2HnbWEKXKcwSL', 'e8faac99e817539bddf62b2d228f9c01da9c5322', 1, '2020-04-02 19:00:00', '4a35e2c7e1da77981c9feed12602d1b35300fafc', 2),
(16, '38199179882', 'Leon', 'Sušek', '1978-07-05', 'Crnogorska ulica 55, 48000 Koprivnica', '0985667439', 'leonsusek@gmail.com', 'lsusek', 'uQKZtFZFQk557Rv', '5a0988c52dad3686dee3776b977557988129e864', 1, '2020-04-02 08:00:00', '7eb5bbc333d2f414ed11bbd213a114ae081c14f7', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Ocjena rada vrtića`
--

CREATE TABLE `Ocjena rada vrtića` (
  `razdoblje` varchar(20) NOT NULL,
  `djecji_vrtic` int(11) NOT NULL,
  `ocjena` int(11) NOT NULL,
  `opis` text NOT NULL,
  `datum_unosa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ocjena rada vrtića`
--

INSERT INTO `Ocjena rada vrtića` (`razdoblje`, `djecji_vrtic`, `ocjena`, `opis`, `datum_unosa`) VALUES
('ožujak', 1, 10, 'Odličan rad.', '2020-04-04'),
('ožujak', 2, 10, 'Odličan rad svih djelatnika, a posebno odgajatelja/ica.', '2020-04-02'),
('ožujak', 3, 5, 'Djelatnici kasne na posao.', '2020-04-03'),
('ožujak', 4, 9, 'Sve odlično, ali nedostajalo je higijenskih potrepština za djecu.', '2020-04-03'),
('ožujak', 5, 10, 'Odličan rad.', '2020-04-02'),
('ožujak', 6, 7, 'Odličan rad svih djelatnika, osim čistačica koje nisu uredile prostorije za djecu.', '2020-04-02'),
('ožujak', 7, 10, 'Odličan rad svih djelatnika.', '2020-04-02'),
('ožujak', 8, 6, 'Djelatnici kasne na posao. Djeca nisu imali odmor nakon ručka. Prostorije nisu bile čiste.', '2020-04-02'),
('ožujak', 9, 10, 'Izvrstan rad svih djelatnika.', '2020-04-01'),
('ožujak', 10, 8, 'Odličan rad, ali nije bilo pripremljenih jela za doručak tjedan dana.', '2020-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `Poziv za upis`
--

CREATE TABLE `Poziv za upis` (
  `poziv_id` int(11) NOT NULL,
  `broj_mjesta` int(11) NOT NULL,
  `upisi_od` date NOT NULL,
  `upisi_do` date NOT NULL,
  `djecji_vrtic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Poziv za upis`
--

INSERT INTO `Poziv za upis` (`poziv_id`, `broj_mjesta`, `upisi_od`, `upisi_do`, `djecji_vrtic`) VALUES
(1, 50, '2019-09-01', '2019-09-15', 1),
(2, 30, '2019-09-01', '2019-09-15', 2),
(3, 40, '2019-09-01', '2019-09-15', 3),
(4, 60, '2019-09-01', '2019-09-15', 4),
(5, 80, '2019-09-01', '2019-09-15', 5),
(6, 25, '2019-09-01', '2019-09-15', 6),
(7, 50, '2019-09-01', '2019-09-15', 8),
(8, 100, '2019-09-01', '2019-09-15', 9),
(9, 90, '2020-03-30', '2020-04-13', 7),
(10, 50, '2020-03-30', '2020-04-13', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Prijava za upis`
--

CREATE TABLE `Prijava za upis` (
  `prijava_id` int(11) NOT NULL,
  `roditelj` int(11) NOT NULL,
  `skupina` int(11) NOT NULL,
  `datum_prijave` date NOT NULL,
  `status_prijave` int(11) NOT NULL DEFAULT '5',
  `poziv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Prijava za upis`
--

INSERT INTO `Prijava za upis` (`prijava_id`, `roditelj`, `skupina`, `datum_prijave`, `status_prijave`, `poziv`) VALUES
(1, 2, 1, '2019-09-10', 4, 1),
(2, 2, 5, '2019-09-10', 4, 5),
(3, 3, 2, '2019-09-05', 4, 2),
(4, 3, 2, '2019-09-05', 4, 2),
(5, 4, 3, '2019-09-05', 4, 3),
(6, 4, 4, '2019-09-05', 4, 4),
(7, 5, 5, '2019-09-13', 4, 5),
(8, 5, 6, '2019-09-13', 4, 6),
(9, 6, 8, '2019-09-03', 4, 7),
(10, 6, 9, '2019-09-03', 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Računi`
--

CREATE TABLE `Računi` (
  `racun_id` int(11) NOT NULL,
  `iznos` float NOT NULL,
  `razdoblje` varchar(20) NOT NULL,
  `datum_izdavanja` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dijete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Računi`
--

INSERT INTO `Računi` (`racun_id`, `iznos`, `razdoblje`, `datum_izdavanja`, `status`, `dijete`) VALUES
(1, 700, 'ožujak', '2020-04-02', 0, 1),
(2, 700, 'ožujak', '2020-04-02', 0, 2),
(3, 500, 'ožujak', '2020-04-02', 1, 3),
(4, 500, 'ožujak', '2020-04-02', 1, 4),
(5, 800, 'ožujak', '2020-04-02', 0, 5),
(6, 400, 'ožujak', '2020-04-02', 1, 6),
(7, 500, 'ožujak', '2020-04-02', 0, 7),
(8, 700, 'ožujak', '2020-04-02', 0, 8),
(9, 600, 'ožujak', '2020-04-01', 1, 9),
(10, 700, 'ožujak', '2020-04-01', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Skupina`
--

CREATE TABLE `Skupina` (
  `skupina_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `cijena` float NOT NULL,
  `broj_mjesta` int(11) NOT NULL,
  `djecji_vrtic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Skupina`
--

INSERT INTO `Skupina` (`skupina_id`, `naziv`, `cijena`, `broj_mjesta`, `djecji_vrtic`) VALUES
(1, 'Predškola', 700, 50, 1),
(2, 'Jaslice', 500, 30, 2),
(3, 'Mlađa vrtićka', 800, 40, 3),
(4, 'Mješovita', 400, 60, 4),
(5, 'Vrtićka', 700, 80, 5),
(6, 'Jaslice', 500, 25, 6),
(7, 'Mješovita', 600, 90, 7),
(8, 'Predškola', 600, 50, 8),
(9, 'Vrtićka', 700, 100, 9),
(10, 'Mlađa vrtićka', 500, 50, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Status prijave`
--

CREATE TABLE `Status prijave` (
  `status_id` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Status prijave`
--

INSERT INTO `Status prijave` (`status_id`, `naziv`, `opis`) VALUES
(1, 'prihvaćena', 'Voditelj dječjeg vrtića je prihvatio prijavu.'),
(2, 'na listi čekanja', 'Kapacitet skupine je popunjen i čeka se oslobođenje mjesta.'),
(3, 'odbijena', 'Roditelj je odbio upisati dijete u vrtić.'),
(4, 'dovršen upis', 'Roditelj je upisao podatke o djetetu i upis je dovršen.'),
(5, 'obrada', 'Prijave za upis još su u tijeku.');

-- --------------------------------------------------------

--
-- Table structure for table `Tip akcije`
--

CREATE TABLE `Tip akcije` (
  `tip_id` int(11) NOT NULL,
  `naziv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Tip akcije`
--

INSERT INTO `Tip akcije` (`tip_id`, `naziv`) VALUES
(1, 'prijava / odjava'),
(2, 'rad s bazom'),
(3, 'ostale radnje');

-- --------------------------------------------------------

--
-- Table structure for table `Vrsta korisnika`
--

CREATE TABLE `Vrsta korisnika` (
  `vrsta_id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vrsta korisnika`
--

INSERT INTO `Vrsta korisnika` (`vrsta_id`, `naziv`, `opis`) VALUES
(1, 'administrator', 'Ima prava na kreiranje, pregledavanja, ažuriranja i brisanja svih podataka iz baze podataka.'),
(2, 'voditelj', 'Ima pravo na kreiranje, pregledavanje i ažuriranje javnih poziva, skupina, prijava, računa i dolazaka djece.'),
(3, 'roditelj', 'Ima pravo na pregled evidencije dolazaka djeteta i popis računa te pravo na kreiranje, ažuriranje i pregledavanje prijava za upis.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Dijete`
--
ALTER TABLE `Dijete`
  ADD PRIMARY KEY (`dijete_id`),
  ADD UNIQUE KEY `oib_UNIQUE` (`oib`),
  ADD KEY `fk_Dijete_Skupina1_idx` (`skupina`),
  ADD KEY `fk_Dijete_Korisnik1_idx` (`roditelj`);

--
-- Indexes for table `Dječji vrtić`
--
ALTER TABLE `Dječji vrtić`
  ADD PRIMARY KEY (`vrtic_id`),
  ADD UNIQUE KEY `moderator_UNIQUE` (`moderator`),
  ADD KEY `fk_Dječji vrtić_Korisnik1_idx` (`moderator`);

--
-- Indexes for table `Dnevnik rada`
--
ALTER TABLE `Dnevnik rada`
  ADD PRIMARY KEY (`datum_vrijeme`,`tip_akcije`,`korisnik`),
  ADD KEY `fk_Dnevnik rada_Tip rada1_idx` (`tip_akcije`),
  ADD KEY `fk_Dnevnik rada_Korisnik1_idx` (`korisnik`);

--
-- Indexes for table `Evidencija dolazaka`
--
ALTER TABLE `Evidencija dolazaka`
  ADD PRIMARY KEY (`datum`,`dijete`),
  ADD KEY `fk_Evidencija dolazaka_Dijete1_idx` (`dijete`);

--
-- Indexes for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD PRIMARY KEY (`korisnik_id`),
  ADD UNIQUE KEY `oib_UNIQUE` (`oib`),
  ADD UNIQUE KEY `korisnicko_ime_UNIQUE` (`korisnicko_ime`),
  ADD KEY `fk_Korisnik_Vrsta korisnika_idx` (`vrsta_korisnika`);

--
-- Indexes for table `Ocjena rada vrtića`
--
ALTER TABLE `Ocjena rada vrtića`
  ADD PRIMARY KEY (`razdoblje`,`djecji_vrtic`),
  ADD KEY `fk_Ocjena rada vrtića_Dječji vrtić1_idx` (`djecji_vrtic`);

--
-- Indexes for table `Poziv za upis`
--
ALTER TABLE `Poziv za upis`
  ADD PRIMARY KEY (`poziv_id`),
  ADD KEY `fk_Poziv za upis_Dječji vrtić1_idx` (`djecji_vrtic`);

--
-- Indexes for table `Prijava za upis`
--
ALTER TABLE `Prijava za upis`
  ADD PRIMARY KEY (`prijava_id`),
  ADD KEY `fk_Prijava za upis_Korisnik1_idx` (`roditelj`),
  ADD KEY `fk_Prijava za upis_Skupina1_idx` (`skupina`),
  ADD KEY `fk_Prijava za upis_Status prijave1_idx` (`status_prijave`),
  ADD KEY `fk_Prijava za upis_Poziv za upis1_idx` (`poziv`);

--
-- Indexes for table `Računi`
--
ALTER TABLE `Računi`
  ADD PRIMARY KEY (`racun_id`),
  ADD KEY `fk_Računi_Dijete1_idx` (`dijete`);

--
-- Indexes for table `Skupina`
--
ALTER TABLE `Skupina`
  ADD PRIMARY KEY (`skupina_id`),
  ADD KEY `fk_Skupina_Dječji vrtić1_idx` (`djecji_vrtic`);

--
-- Indexes for table `Status prijave`
--
ALTER TABLE `Status prijave`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `Tip akcije`
--
ALTER TABLE `Tip akcije`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indexes for table `Vrsta korisnika`
--
ALTER TABLE `Vrsta korisnika`
  ADD PRIMARY KEY (`vrsta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Dijete`
--
ALTER TABLE `Dijete`
  MODIFY `dijete_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Dječji vrtić`
--
ALTER TABLE `Dječji vrtić`
  MODIFY `vrtic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Korisnik`
--
ALTER TABLE `Korisnik`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `Poziv za upis`
--
ALTER TABLE `Poziv za upis`
  MODIFY `poziv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Prijava za upis`
--
ALTER TABLE `Prijava za upis`
  MODIFY `prijava_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Računi`
--
ALTER TABLE `Računi`
  MODIFY `racun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Skupina`
--
ALTER TABLE `Skupina`
  MODIFY `skupina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Status prijave`
--
ALTER TABLE `Status prijave`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Tip akcije`
--
ALTER TABLE `Tip akcije`
  MODIFY `tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Vrsta korisnika`
--
ALTER TABLE `Vrsta korisnika`
  MODIFY `vrsta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Dijete`
--
ALTER TABLE `Dijete`
  ADD CONSTRAINT `fk_Dijete_Skupina1` FOREIGN KEY (`skupina`) REFERENCES `Skupina` (`skupina_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dijete_Korisnik1` FOREIGN KEY (`roditelj`) REFERENCES `Korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dječji vrtić`
--
ALTER TABLE `Dječji vrtić`
  ADD CONSTRAINT `fk_Dječji vrtić_Korisnik1` FOREIGN KEY (`moderator`) REFERENCES `Korisnik` (`korisnik_id`) ON UPDATE CASCADE;

--
-- Constraints for table `Dnevnik rada`
--
ALTER TABLE `Dnevnik rada`
  ADD CONSTRAINT `fk_Dnevnik rada_Tip rada1` FOREIGN KEY (`tip_akcije`) REFERENCES `Tip akcije` (`tip_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Dnevnik rada_Korisnik1` FOREIGN KEY (`korisnik`) REFERENCES `Korisnik` (`korisnik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Evidencija dolazaka`
--
ALTER TABLE `Evidencija dolazaka`
  ADD CONSTRAINT `fk_Evidencija dolazaka_Dijete1` FOREIGN KEY (`dijete`) REFERENCES `Dijete` (`dijete_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD CONSTRAINT `fk_Korisnik_Vrsta korisnika` FOREIGN KEY (`vrsta_korisnika`) REFERENCES `Vrsta korisnika` (`vrsta_id`) ON UPDATE CASCADE;

--
-- Constraints for table `Ocjena rada vrtića`
--
ALTER TABLE `Ocjena rada vrtića`
  ADD CONSTRAINT `fk_Ocjena rada vrtića_Dječji vrtić1` FOREIGN KEY (`djecji_vrtic`) REFERENCES `Dječji vrtić` (`vrtic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Poziv za upis`
--
ALTER TABLE `Poziv za upis`
  ADD CONSTRAINT `fk_Poziv za upis_Dječji vrtić1` FOREIGN KEY (`djecji_vrtic`) REFERENCES `Dječji vrtić` (`vrtic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Prijava za upis`
--
ALTER TABLE `Prijava za upis`
  ADD CONSTRAINT `fk_Prijava za upis_Korisnik1` FOREIGN KEY (`roditelj`) REFERENCES `Korisnik` (`korisnik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prijava za upis_Skupina1` FOREIGN KEY (`skupina`) REFERENCES `Skupina` (`skupina_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prijava za upis_Status prijave1` FOREIGN KEY (`status_prijave`) REFERENCES `Status prijave` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prijava za upis_Poziv za upis1` FOREIGN KEY (`poziv`) REFERENCES `Poziv za upis` (`poziv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Računi`
--
ALTER TABLE `Računi`
  ADD CONSTRAINT `fk_Računi_Dijete1` FOREIGN KEY (`dijete`) REFERENCES `Dijete` (`dijete_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Skupina`
--
ALTER TABLE `Skupina`
  ADD CONSTRAINT `fk_Skupina_Dječji vrtić1` FOREIGN KEY (`djecji_vrtic`) REFERENCES `Dječji vrtić` (`vrtic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
