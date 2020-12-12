-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 06:24 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr7_albadri`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ID_class` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ID_class`, `class_name`) VALUES
(1, '1a'),
(2, '1b'),
(3, '2a'),
(4, '2b'),
(5, '3a'),
(6, '3b'),
(7, '4a'),
(8, '4b');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID_student` int(11) NOT NULL,
  `student_name` varchar(60) NOT NULL,
  `student_surname` varchar(60) NOT NULL,
  `student_email` varchar(60) NOT NULL,
  `ID_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`ID_student`, `student_name`, `student_surname`, `student_email`, `ID_class`) VALUES
(1, 'maxi', 'jack', 'maxi@gmx.at', 1),
(2, 'Rami', 'lechner', 'rami@gmx.at', 1),
(3, 'maria', 'loes', 'maria@gmx.at', 2),
(4, 'sola', 'deo', 'sola@gmail.com', 2),
(5, 'JOE', 'lala', 'joe@gmail.com', 3),
(6, 'Amly', 'loen', 'amly@gmx.net', 4),
(7, 'ali', 'loba', 'ali@gmx.net', 5),
(8, 'Sara', 'well', 'sara@gmx.at', 6),
(9, 'sami', 'loku', 'sami@gmail.com', 7),
(10, 'loes', 'sola', 'loes@gmail.com', 8);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `ID_teacher` int(11) NOT NULL,
  `teacher_name` varchar(100) NOT NULL,
  `teacher_surname` varchar(100) NOT NULL,
  `teacher_email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`ID_teacher`, `teacher_name`, `teacher_surname`, `teacher_email`) VALUES
(1, 'maxi', 'müller', 'maxi@gmx.at'),
(2, 'joe', 'Doe', 'joe@gmail.com'),
(3, 'maia', 'hani', 'maia@hotmail.com'),
(4, 'Ali', 'ota', 'Ali@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `teachers_classes`
--

CREATE TABLE `teachers_classes` (
  `ID_teachers_classes` int(11) NOT NULL,
  `ID_teacher` int(11) NOT NULL,
  `ID_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers_classes`
--

INSERT INTO `teachers_classes` (`ID_teachers_classes`, `ID_teacher`, `ID_class`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ID_class`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID_student`),
  ADD KEY `FK_ID_class` (`ID_class`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`ID_teacher`);

--
-- Indexes for table `teachers_classes`
--
ALTER TABLE `teachers_classes`
  ADD PRIMARY KEY (`ID_teachers_classes`),
  ADD KEY `FK_ID_class2` (`ID_class`),
  ADD KEY `FK_ID_teacher` (`ID_teacher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ID_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `ID_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID_teacher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers_classes`
--
ALTER TABLE `teachers_classes`
  MODIFY `ID_teachers_classes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `FK_ID_class` FOREIGN KEY (`ID_class`) REFERENCES `classes` (`ID_class`);

--
-- Constraints for table `teachers_classes`
--
ALTER TABLE `teachers_classes`
  ADD CONSTRAINT `FK_ID_class2` FOREIGN KEY (`ID_class`) REFERENCES `classes` (`ID_class`),
  ADD CONSTRAINT `FK_ID_teacher` FOREIGN KEY (`ID_teacher`) REFERENCES `teachers` (`ID_teacher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
