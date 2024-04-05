-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 01:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phptest`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'lama', '$2y$10$RZm6xxZjn2.ceLP02YyALuazVNU/LfAoBAPByU6Rrzt7h2pwqeiC.');

-- --------------------------------------------------------

--
-- Table structure for table `xml_data`
--

CREATE TABLE `xml_data` (
  `id` int(11) NOT NULL,
  `xml_content` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `xml_data`
--

INSERT INTO `xml_data` (`id`, `xml_content`) VALUES
(1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Users>\n	<User Name=\"Петров Владимир Ильич\">\n		<Pets>\n			<Pet Code=\"001\" Type=\"Собака\" Gender=\"м\" Age=\"3\">\n				<Nickname Value=\"Бобик\"/>\n				<Breed Name=\"Йоркширский терьер\"/>\n				<Rewards>\n					<Reward Name=\"Золотая медаль выставки №2\"/>\n				</Rewards>\n			</Pet>\n			<Pet Code=\"002\" Type=\"Собака\" Gender=\"м\" Age=\"1\">\n				<Nickname Value=\"Джон\"/>\n				<Breed Name=\"Йоркширский терьер\"/>				\n			</Pet>\n		</Pets>\n	</User>\n	<User Name=\"Сидорова Мария Петровна\">\n		<Pets>			\n			<Pet Code=\"003\" Type=\"Кот\" Gender=\"м\" Age=\"8\">\n				<Nickname Value=\"Барсик\"/>\n				<Breed Name=\"Персидская кошка\"/>				\n			</Pet>\n			<Pet Code=\"004\" Type=\"Кот\" Gender=\"ж\" Age=\"2\">\n				<Nickname Value=\"Пуля\"/>\n				<Breed Name=\"Абиссинская кошка\"/>\n				<Parents>\n					<Parent Code=\"005\"/>\n				</Parents>\n			</Pet>\n			<Pet Code=\"005\" Type=\"Кот\" Gender=\"ж\" Age=\"4\">\n				<Nickname Value=\"Лапуля\"/>\n				<Breed Name=\"Абиссинская кошка\"/>				\n			</Pet>\n			<Pet Code=\"006\" Type=\"Кот\" Gender=\"m\" Age=\"1\">\n				<Nickname Value=\"Феликс\"/>\n				<Breed Name=\"Сибирская кошка\"/>				\n			</Pet>\n		</Pets>\n	</User>\n	<User Name=\"Ромашкин Андрей Петрович\">\n		<Pets>			\n			<Pet Code=\"007\" Type=\"Змея\" Gender=\"ж\" Age=\"1\">\n				<Nickname Value=\"Вэя\"/>\n				<Breed Name=\"Радужный удав\"/>\n				<Parents>\n					<Parent Code=\"008\"/>\n					<Parent Code=\"009\"/>\n				</Parents>\n			</Pet>\n			<Pet Code=\"008\" Type=\"Змея\" Gender=\"ж\" Age=\"2\">\n				<Nickname Value=\"Корра\"/>\n				<Breed Name=\"Радужный удав\"/>				\n			</Pet>\n			<Pet Code=\"009\" Type=\"Змея\" Gender=\"m\" Age=\"3.5\">\n				<Nickname Value=\"Долгоносик\"/>\n				<Breed Name=\"Радужный удав\"/>				\n			</Pet>\n		</Pets>\n	</User>\n	<User Name=\"Михненко Ирина Сергеевна\">\n		<Pets>			\n			<Pet Code=\"010\" Type=\"Собака\" Gender=\"м\" Age=\"16\">\n				<Nickname Value=\"Пискля\"/>\n				<Breed Name=\"Чихуахуа\"/>\n				<Rewards>\n					<Reward Name=\"Лучший друг 2000 года\"/>\n					<Reward Name=\"Выставка собак №56\"/>\n					<Reward Name=\"Благодарность за активное участие в жизне клуба\"/>					\n				</Rewards>				\n			</Pet>			\n		</Pets>\n	</User>\n</Users>\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xml_data`
--
ALTER TABLE `xml_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xml_data`
--
ALTER TABLE `xml_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
