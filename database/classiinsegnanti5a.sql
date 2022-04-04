-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 12, 2020 alle 08:59
-- Versione del server: 10.4.6-MariaDB
-- Versione PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classiinsegnanti5a`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `rinsegnain`
--

CREATE TABLE `rinsegnain` (
  `idinsegnain` int(11) NOT NULL,
  `codinsegnante` int(11) NOT NULL,
  `codclasse` int(11) NOT NULL,
  `numore` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `rinsegnain`
--

INSERT INTO `rinsegnain` (`idinsegnain`, `codinsegnante`, `codclasse`, `numore`) VALUES
(1, 1, 1, 4),
(2, 5, 1, 6),
(3, 3, 2, 6),
(4, 4, 1, 3),
(5, 2, 3, 2),
(7, 9, 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `tclassi`
--

CREATE TABLE `tclassi` (
  `idclasse` int(11) NOT NULL,
  `nomeclasse` varchar(10) NOT NULL,
  `speclasse` varchar(20) NOT NULL,
  `piano` int(11) NOT NULL,
  `ala` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tclassi`
--

INSERT INTO `tclassi` (`idclasse`, `nomeclasse`, `speclasse`, `piano`, `ala`) VALUES
(1, '3Ain', 'informatica', 2, 'nord'),
(2, '4Ain', 'informatica', 3, 'est'),
(3, '1C', 'biennio', 3, 'sud'),
(4, '4Alog', 'logistica', 0, 'sud');

-- --------------------------------------------------------

--
-- Struttura della tabella `tinsegnanti`
--

CREATE TABLE `tinsegnanti` (
  `idinsegnante` int(11) NOT NULL,
  `cognomeins` varchar(20) NOT NULL,
  `nomeins` varchar(20) NOT NULL,
  `cfins` varchar(16) NOT NULL,
  `mailins` varchar(20) DEFAULT NULL,
  `telins` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tinsegnanti`
--

INSERT INTO `tinsegnanti` (`idinsegnante`, `cognomeins`, `nomeins`, `cfins`, `mailins`, `telins`) VALUES
(1, 'Pattuelli', 'Piero', 'PPPPPPPPPPPPPPP', NULL, '999999999'),
(2, 'Zolli', 'Marco', 'ZZZZZZZZZZZZZZZ', 'zz@zz.it', '8888888888'),
(3, 'Lonanesi', 'Gianni', 'LLLLLLLLLLLLLLLL', NULL, '7777777777777'),
(4, 'Marresi', 'Tomas', 'MMMMMMMMMMMMMMMM', NULL, '555555555555'),
(5, 'Buscheri', 'Sandro', 'BBBBBBBBBBBBBBBB', NULL, '4444444444444444'),
(6, 'Sabbi', 'Simona', 'SSSSSSSSSSSSSSSS', NULL, '1111111111111111'),
(7, 'Cavalli', 'Luisella', 'CCCCCCCCCCCCCCCC', NULL, '2222222222222222'),
(9, 'test', 'test', 'TTTTTTTTTTTTTTTT', NULL, '5555555555555555');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `rinsegnain`
--
ALTER TABLE `rinsegnain`
  ADD PRIMARY KEY (`idinsegnain`),
  ADD UNIQUE KEY `codinsegnante` (`codinsegnante`,`codclasse`),
  ADD KEY `codclasse` (`codclasse`);

--
-- Indici per le tabelle `tclassi`
--
ALTER TABLE `tclassi`
  ADD PRIMARY KEY (`idclasse`),
  ADD UNIQUE KEY `nomeclasse` (`nomeclasse`);

--
-- Indici per le tabelle `tinsegnanti`
--
ALTER TABLE `tinsegnanti`
  ADD PRIMARY KEY (`idinsegnante`),
  ADD UNIQUE KEY `cognomeins` (`cognomeins`,`nomeins`),
  ADD UNIQUE KEY `cfins` (`cfins`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `rinsegnain`
--
ALTER TABLE `rinsegnain`
  MODIFY `idinsegnain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `tclassi`
--
ALTER TABLE `tclassi`
  MODIFY `idclasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `tinsegnanti`
--
ALTER TABLE `tinsegnanti`
  MODIFY `idinsegnante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `rinsegnain`
--
ALTER TABLE `rinsegnain`
  ADD CONSTRAINT `rinsegnain_ibfk_1` FOREIGN KEY (`codinsegnante`) REFERENCES `tinsegnanti` (`idinsegnante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rinsegnain_ibfk_2` FOREIGN KEY (`codclasse`) REFERENCES `tclassi` (`idclasse`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
