-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 30, 2019 at 12:31 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `code_milwaukee_db`
--
CREATE DATABASE IF NOT EXISTS `code_milwaukee_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `code_milwaukee_db`;

-- --------------------------------------------------------

--
-- Table structure for table `tblDesignSkill`
--

CREATE TABLE `tblDesignSkill` (
  `designSkill` varchar(32) NOT NULL,
  `designSkillId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblDesignSkill`
--

INSERT INTO `tblDesignSkill` (`designSkill`, `designSkillId`) VALUES
('Adobe DreamWeaver', 3),
('Adobe Illustrator', 5),
('Adobe InDesign', 2),
('Adobe Photoshop', 4),
('Adobe XD', 6),
('Photo Editing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblParticipants`
--

CREATE TABLE `tblParticipants` (
  `fname` varchar(64) NOT NULL,
  `lname` varchar(64) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phoneNum` varchar(16) DEFAULT NULL,
  `aboutMe` varchar(500) DEFAULT NULL,
  `partId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblParticipants`
--

INSERT INTO `tblParticipants` (`fname`, `lname`, `email`, `phoneNum`, `aboutMe`, `partId`) VALUES
('Alex', 'VanBeekum', 'ajvanbeekum@gmail.com', '', '', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tblProgrammingLanguage`
--

CREATE TABLE `tblProgrammingLanguage` (
  `language` varchar(32) NOT NULL,
  `languageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblProgrammingLanguage`
--

INSERT INTO `tblProgrammingLanguage` (`language`, `languageId`) VALUES
('C', 4),
('C#', 5),
('C++', 6),
('CSS', 13),
('HTML', 12),
('Java', 3),
('JavaScript', 1),
('Objective - C', 11),
('PHP', 7),
('Python', 2),
('Ruby', 8),
('SQL', 10),
('Swift', 9);

-- --------------------------------------------------------

--
-- Table structure for table `xrefPartDesignSkill`
--

CREATE TABLE `xrefPartDesignSkill` (
  `partId` int(11) NOT NULL,
  `designSkillId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xrefPartDesignSkill`
--

INSERT INTO `xrefPartDesignSkill` (`partId`, `designSkillId`) VALUES
(17, 3),
(17, 4),
(17, 5),
(17, 6);

-- --------------------------------------------------------

--
-- Table structure for table `xrefPartProgrammingLanguage`
--

CREATE TABLE `xrefPartProgrammingLanguage` (
  `partId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xrefPartProgrammingLanguage`
--

INSERT INTO `xrefPartProgrammingLanguage` (`partId`, `languageId`) VALUES
(17, 1),
(17, 2),
(17, 7),
(17, 10),
(17, 12),
(17, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblDesignSkill`
--
ALTER TABLE `tblDesignSkill`
  ADD PRIMARY KEY (`designSkillId`),
  ADD UNIQUE KEY `designSkill` (`designSkill`);

--
-- Indexes for table `tblParticipants`
--
ALTER TABLE `tblParticipants`
  ADD PRIMARY KEY (`partId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblProgrammingLanguage`
--
ALTER TABLE `tblProgrammingLanguage`
  ADD PRIMARY KEY (`languageId`),
  ADD UNIQUE KEY `language` (`language`);

--
-- Indexes for table `xrefPartDesignSkill`
--
ALTER TABLE `xrefPartDesignSkill`
  ADD PRIMARY KEY (`partId`,`designSkillId`),
  ADD KEY `designSkillId` (`designSkillId`);

--
-- Indexes for table `xrefPartProgrammingLanguage`
--
ALTER TABLE `xrefPartProgrammingLanguage`
  ADD PRIMARY KEY (`partId`,`languageId`),
  ADD KEY `languageId` (`languageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblDesignSkill`
--
ALTER TABLE `tblDesignSkill`
  MODIFY `designSkillId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblParticipants`
--
ALTER TABLE `tblParticipants`
  MODIFY `partId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblProgrammingLanguage`
--
ALTER TABLE `tblProgrammingLanguage`
  MODIFY `languageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `xrefPartDesignSkill`
--
ALTER TABLE `xrefPartDesignSkill`
  ADD CONSTRAINT `xrefpartdesignskill_ibfk_1` FOREIGN KEY (`partId`) REFERENCES `tblParticipants` (`partId`),
  ADD CONSTRAINT `xrefpartdesignskill_ibfk_2` FOREIGN KEY (`designSkillId`) REFERENCES `tblDesignSkill` (`designSkillId`);

--
-- Constraints for table `xrefPartProgrammingLanguage`
--
ALTER TABLE `xrefPartProgrammingLanguage`
  ADD CONSTRAINT `xrefpartprogramminglanguage_ibfk_1` FOREIGN KEY (`partId`) REFERENCES `tblParticipants` (`partId`),
  ADD CONSTRAINT `xrefpartprogramminglanguage_ibfk_2` FOREIGN KEY (`languageId`) REFERENCES `tblProgrammingLanguage` (`languageId`);
SET FOREIGN_KEY_CHECKS=1;
