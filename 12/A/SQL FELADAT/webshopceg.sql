-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2025 at 09:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshopceg`
--

-- --------------------------------------------------------

--
-- Table structure for table `felhasznaloi_szerepkor`
--

CREATE TABLE `felhasznaloi_szerepkor` (
  `Felh_id` int(11) NOT NULL,
  `Egyedi_id` int(11) DEFAULT NULL,
  `Szerepkor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `felhasznaloi_szerepkor`
--

INSERT INTO `felhasznaloi_szerepkor` (`Felh_id`, `Egyedi_id`, `Szerepkor`) VALUES
(1, 1, 'Adminisztrátor'),
(2, 2, 'Felhasználó'),
(3, 7, 'Szuperadmin'),
(4, 3, 'Szállító'),
(5, 4, 'Ügyfélszolgálat'),
(6, 5, 'Marketing'),
(7, 6, 'Tesztelő'),
(8, 8, 'Vezető');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `Felh_id` int(11) NOT NULL,
  `Felhnev` varchar(45) NOT NULL,
  `Jelszo` varchar(45) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Aktiv` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `felhasznalok`
--

INSERT INTO `felhasznalok` (`Felh_id`, `Felhnev`, `Jelszo`, `Email`, `Aktiv`) VALUES
(1, 'johndoe', 'jelszo123', 'johndoe@example.com', 1),
(2, 'janedoe', 'janeszo456', 'janedoe@example.com', 1),
(3, 'admin', 'admin123', 'admin@example.com', 1),
(4, 'klaus', 'klaus789', 'klaus@example.com', 0),
(5, 'maria', 'maria123', 'maria@example.com', 1),
(6, 'petra', 'petra321', 'petra@example.com', 1),
(7, 'zsolt', 'zsolt987', 'zsolt@example.com', 1),
(8, 'andras', 'andras654', 'andras@example.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jogosultsagok`
--

CREATE TABLE `jogosultsagok` (
  `Jogosult_id` int(11) NOT NULL,
  `Jogosultsag_neve` varchar(45) NOT NULL,
  `Leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `jogosultsagok`
--

INSERT INTO `jogosultsagok` (`Jogosult_id`, `Jogosultsag_neve`, `Leiras`) VALUES
(1, 'Termékek hozzáadása', 'Új termékek hozzáadásának jogosultsága.'),
(2, 'Termékek módosítása', 'Meglévő termékek módosításához szükséges jogosultság.'),
(3, 'Rendelések kezelése', 'A rendelések nyomon követéséhez és kezeléséhez szükséges jogosultság.'),
(4, 'Felhasználói fiókok kezelése', 'Felhasználói fiókok hozzáférése és módosítása.'),
(5, 'Promóciók indítása', 'Új promóciók és kedvezmények kezelése.'),
(6, 'Webshop statisztikák megtekintése', 'Webshop forgalmi adatai és statisztikák megtekintésének jogosultsága.'),
(7, 'Felhasználók aktivitásának ellenőrzése', 'Felhasználói aktivitás és viselkedés elemzésének jogosultsága.'),
(8, 'Adatbázis karbantartás', 'Az adatbázis karbantartásához szükséges jogok.');

-- --------------------------------------------------------

--
-- Table structure for table `szerepkorok`
--

CREATE TABLE `szerepkorok` (
  `Egyedi_id` int(11) NOT NULL,
  `Szerepkor_nev` varchar(45) NOT NULL,
  `Leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `szerepkorok`
--

INSERT INTO `szerepkorok` (`Egyedi_id`, `Szerepkor_nev`, `Leiras`) VALUES
(1, 'Adminisztrátor', 'Teljes körű hozzáférés minden funkcióhoz.'),
(2, 'Felhasználó', 'Alap hozzáférés a webshophoz, termékek megtekintése és vásárlás.'),
(3, 'Szállító', 'Rendelések kezeléséhez szükséges hozzáférés.'),
(4, 'Ügyfélszolgálat', 'Rendelések és felhasználói problémák kezeléséhez szükséges jogosultság.'),
(5, 'Marketing', 'Termékek és promóciók kezelése, kampányok indítása.'),
(6, 'Tesztelő', 'Webshop tesztelése és hibajavítások alkalmazása.'),
(7, 'Szuperadmin', 'Minden hozzáférés és adminisztrátori jogkör.'),
(8, 'Vezető', 'A fő adminisztrátor által biztosított jogkörök.');

-- --------------------------------------------------------

--
-- Table structure for table `szerepkor_jogosultsag`
--

CREATE TABLE `szerepkor_jogosultsag` (
  `Kapocs_id` int(11) NOT NULL,
  `Egyedi_id` int(11) DEFAULT NULL,
  `Jogosult_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `szerepkor_jogosultsag`
--

INSERT INTO `szerepkor_jogosultsag` (`Kapocs_id`, `Egyedi_id`, `Jogosult_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felhasznaloi_szerepkor`
--
ALTER TABLE `felhasznaloi_szerepkor`
  ADD PRIMARY KEY (`Felh_id`),
  ADD KEY `Egyedi_id` (`Egyedi_id`);

--
-- Indexes for table `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`Felh_id`);

--
-- Indexes for table `jogosultsagok`
--
ALTER TABLE `jogosultsagok`
  ADD PRIMARY KEY (`Jogosult_id`);

--
-- Indexes for table `szerepkorok`
--
ALTER TABLE `szerepkorok`
  ADD PRIMARY KEY (`Egyedi_id`);

--
-- Indexes for table `szerepkor_jogosultsag`
--
ALTER TABLE `szerepkor_jogosultsag`
  ADD PRIMARY KEY (`Kapocs_id`),
  ADD KEY `Egyedi_id` (`Egyedi_id`),
  ADD KEY `Jogosult_id` (`Jogosult_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felhasznaloi_szerepkor`
--
ALTER TABLE `felhasznaloi_szerepkor`
  ADD CONSTRAINT `felhasznaloi_szerepkor_ibfk_1` FOREIGN KEY (`Felh_id`) REFERENCES `felhasznalok` (`Felh_id`),
  ADD CONSTRAINT `felhasznaloi_szerepkor_ibfk_2` FOREIGN KEY (`Egyedi_id`) REFERENCES `szerepkorok` (`Egyedi_id`);

--
-- Constraints for table `szerepkor_jogosultsag`
--
ALTER TABLE `szerepkor_jogosultsag`
  ADD CONSTRAINT `szerepkor_jogosultsag_ibfk_1` FOREIGN KEY (`Egyedi_id`) REFERENCES `szerepkorok` (`Egyedi_id`),
  ADD CONSTRAINT `szerepkor_jogosultsag_ibfk_2` FOREIGN KEY (`Jogosult_id`) REFERENCES `jogosultsagok` (`Jogosult_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
