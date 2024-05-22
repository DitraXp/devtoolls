-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 22. 10:06
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ingatlan`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ingatlanok`
--

CREATE TABLE `ingatlanok` (
  `id` int(11) NOT NULL,
  `kategoria` int(11) DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `hirdetesDatuma` date DEFAULT NULL,
  `tehermentes` tinyint(1) NOT NULL,
  `ar` int(11) NOT NULL,
  `kepUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ingatlanok`
--

INSERT INTO `ingatlanok` (`id`, `kategoria`, `leiras`, `hirdetesDatuma`, `tehermentes`, `ar`, `kepUrl`) VALUES
(19, 7, 'Kertvárosi részén, egyszintes házat kínálunk nyugodt környezetben, nagy telken.', '2022-02-24', 1, 43420000, 'https://cdn.jhmrad.com/wp-content/uploads/three-single-storey-houses-elegance-amazing_704000.jpg'),
(20, 7, 'Belvárosi környezetben, árnyékos helyen kis méretű családi ház eladó. Tömegközlekedéssel könnyen megközelíthető.', '2022-01-12', 0, 21500000, 'https://www.westsideseattle.com/sites/default/files/styles/news_teaser/public/images/archive/ballardnewstribune.com/content/articles/2008/11/21/features/columnists/column07.jpg?itok=wMrlOwFU'),
(21, 8, 'Kétszintes berendezett lakás a belvárosban kiadó.', '2022-03-02', 1, 625000, 'https://images.unsplash.com/photo-1606074280798-2dabb75ce10c?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(22, 10, 'Nagy garázs kertvárosi környezetben kiadó.', '2022-02-27', 1, 378000, 'https://www.afritechmedia.com/wp-content/uploads/2021/11/How-Can-You-Protect-Your-Garage-Floor-612x340.jpg'),
(23, 11, '10 hektáros mezőgazdasági terület eladó.', '2022-01-31', 0, 425000000, 'https://i2-prod.manchestereveningnews.co.uk/incoming/article18411144.ece/ALTERNATES/s810/0_gettyimages-1151774950-170667a.jpg'),
(24, 12, 'Felújításra szoruló üzemcsarnok zöld környezetben áron alul eladó.', '2022-01-12', 0, 80000000, 'https://cdn.pixabay.com/photo/2019/01/31/09/24/urban-3966306_960_720.jpg'),
(32, 12, 'Ipari ingatlan eladó a fővároshoz közel.', '2024-02-22', 1, 0, 'https://img.mik.hu/img/948/632/media/ingatlanforrask/1de1d174037b1e9d9014b9f1db9666c31710002c.jpg'),
(33, 10, 'Garázs eladó', '2024-02-22', 1, 0, 'https://dkmobilgarazs.hu/krzys/wp-content/uploads/2021/02/Harom-kocsis-garazs-Premium-9m-x-5m-Dio-Melyfekete.jpg'),
(34, 11, 'kdkljdfjisfo', '2024-02-27', 1, 0, ''),
(35, 7, '', '2024-05-19', 0, 0, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `nev`) VALUES
(9, 'Építési telek'),
(10, 'Garázs'),
(7, 'Ház'),
(12, 'Ipari ingatlan'),
(8, 'Lakás'),
(11, 'Mezőgazdasági terület');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria` (`kategoria`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD CONSTRAINT `ingatlanok_ibfk_1` FOREIGN KEY (`kategoria`) REFERENCES `kategoriak` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
