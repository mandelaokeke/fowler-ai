-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 03, 2025 at 01:59 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FowlerAdvisingDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `AIMatchRecommendation`
--

CREATE TABLE `AIMatchRecommendation` (
  `StudentID` varchar(10) NOT NULL,
  `CounselorID` int NOT NULL,
  `MatchingScore` decimal(4,2) DEFAULT NULL,
  `DateGenerated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AIMatchRecommendation`
--

INSERT INTO `AIMatchRecommendation` (`StudentID`, `CounselorID`, `MatchingScore`, `DateGenerated`) VALUES
('GW1654849', 107, 87.10, '2025-04-25'),
('GW2119081', 102, 85.00, '2025-04-25'),
('GW2378689', 104, 91.00, '2025-04-25'),
('GW2409871', 100, 92.50, '2025-04-25'),
('GW2547865', 108, 90.50, '2025-04-25'),
('GW2567801', 103, 89.40, '2025-04-25'),
('GW2583871', 101, 88.30, '2025-04-25'),
('GW2597640', 109, 88.00, '2025-04-25'),
('GW2609089', 106, 83.75, '2025-04-25'),
('GW2687279', 105, 86.20, '2025-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `AppointmentSession`
--

CREATE TABLE `AppointmentSession` (
  `AppointmentID` int NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `CounselorID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `AppointmentType` varchar(50) DEFAULT NULL,
  `Mode` enum('In-Person','Virtual') DEFAULT NULL,
  `Status` enum('Confirmed','Pending','Denied') DEFAULT NULL,
  `SessionSummary` text,
  `MeetingNotes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AppointmentSession`
--

INSERT INTO `AppointmentSession` (`AppointmentID`, `StudentID`, `CounselorID`, `Date`, `Time`, `AppointmentType`, `Mode`, `Status`, `SessionSummary`, `MeetingNotes`) VALUES
(1, 'GW2409871', 100, '2025-05-01', '10:00:00', 'Resume Review', 'In-Person', 'Confirmed', 'Discussed resume edits', 'Advised on structuring achievements.'),
(2, 'GW2583871', 101, '2025-05-02', '11:30:00', 'Mock Interview', 'Virtual', 'Confirmed', 'Mock interview preparation', 'Suggested stronger STAR method answers.'),
(3, 'GW2119081', 102, '2025-05-03', '13:00:00', 'Career Planning', 'In-Person', 'Pending', 'Discussed marketing career paths', 'Recommended PR internship.'),
(4, 'GW2567801', 103, '2025-05-04', '14:00:00', 'Analytics Careers', 'Virtual', 'Confirmed', 'Analytics industry insights', 'Suggested Tableau certification.'),
(5, 'GW2378689', 104, '2025-05-05', '09:00:00', 'MBA Career Paths', 'In-Person', 'Confirmed', 'Discussed banking careers', 'Provided job application tips.'),
(6, 'GW2687279', 105, '2025-05-06', '10:30:00', 'Project Management', 'Virtual', 'Confirmed', 'Project management skills', 'Recommended PMP certification.'),
(7, 'GW2609089', 106, '2025-05-07', '11:00:00', 'Accounting Careers', 'In-Person', 'Confirmed', 'Accounting job strategies', 'Suggested networking events.'),
(8, 'GW1654849', 107, '2025-05-08', '13:30:00', 'Consulting Skills', 'Virtual', 'Pending', 'Consulting case prep', 'Recommended case book resources.'),
(9, 'GW2547865', 108, '2025-05-09', '15:00:00', 'Entrepreneurship', 'In-Person', 'Confirmed', 'Startup advice', 'Introduced accelerator programs.'),
(10, 'GW2597640', 109, '2025-05-10', '16:00:00', 'Global Business', 'Virtual', 'Confirmed', 'International career strategies', 'Recommended language courses.');

-- --------------------------------------------------------

--
-- Table structure for table `CareerInterest`
--

CREATE TABLE `CareerInterest` (
  `CareerID` int NOT NULL,
  `CareerName` varchar(100) DEFAULT NULL,
  `CareerIndustry` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CareerInterest`
--

INSERT INTO `CareerInterest` (`CareerID`, `CareerName`, `CareerIndustry`) VALUES
(3001, 'Finance', 'Banking'),
(3002, 'Technology', 'Software Development'),
(3003, 'Marketing', 'Advertising'),
(3004, 'Consulting', 'Management Consulting'),
(3005, 'Analytics', 'Data Science'),
(3006, 'Entrepreneurship', 'Startups'),
(3007, 'Project Management', 'Business'),
(3008, 'International Business', 'Trade'),
(3009, 'Healthcare Management', 'Healthcare'),
(3010, 'Cybersecurity', 'IT Security');

-- --------------------------------------------------------

--
-- Table structure for table `Counselor`
--

CREATE TABLE `Counselor` (
  `CounselorID` int NOT NULL,
  `CounselorName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Certification` varchar(100) DEFAULT NULL,
  `IndustriesOfExpertise` text,
  `PreferredTopics` text,
  `Availability` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Counselor`
--

INSERT INTO `Counselor` (`CounselorID`, `CounselorName`, `Email`, `PhoneNo`, `Specialization`, `Certification`, `IndustriesOfExpertise`, `PreferredTopics`, `Availability`) VALUES
(100, 'Samantha Reed', 'samantha.reed@gwu.edu', '2025550201', 'Finance', 'CFA', 'Banking, Investments', 'Career Planning, Resume Review', 'MWF 9-5'),
(101, 'Tom Walker', 'tom.walker@gwu.edu', '2025550202', 'Tech Careers', 'AWS Certified', 'Software, IT', 'Mock Interviews, Tech Careers', 'TTh 10-4'),
(102, 'Nancy Drew', 'nancy.drew@gwu.edu', '2025550203', 'Marketing', 'PMP', 'Advertising, PR', 'Networking, Personal Branding', 'MW 1-6'),
(103, 'Victor Hugo', 'victor.hugo@gwu.edu', '2025550204', 'Analytics', 'Tableau Specialist', 'Consulting, Data Science', 'Analytics Careers, Resume Tips', 'MWF 9-3'),
(104, 'Olivia Pope', 'olivia.pope@gwu.edu', '2025550205', 'Management', 'Lean Six Sigma', 'Consulting, Healthcare', 'Career Change, MBA Careers', 'TTh 11-5'),
(105, 'Jason Bourne', 'jason.bourne@gwu.edu', '2025550206', 'Project Management', 'PMP', 'Tech, Business', 'Leadership Coaching, Interviews', 'MWF 8-2'),
(106, 'Lara Croft', 'lara.croft@gwu.edu', '2025550207', 'Finance', 'CPA', 'Finance, Banking', 'Accounting Careers', 'MW 10-4'),
(107, 'Clark Kent', 'clark.kent@gwu.edu', '2025550208', 'Consulting', 'MBA', 'Consulting, Strategy', 'Case Interviews, Strategic Careers', 'TTh 1-6'),
(108, 'Bruce Wayne', 'bruce.wayne@gwu.edu', '2025550209', 'Entrepreneurship', 'Start-up Mentor', 'Venture Capital, Startups', 'Startups, VC Funding', 'MW 2-6'),
(109, 'Diana Prince', 'diana.prince@gwu.edu', '2025550210', 'International Business', 'MBA', 'International Trade', 'Global Careers', 'TTh 9-3');

-- --------------------------------------------------------

--
-- Table structure for table `Feedback`
--

CREATE TABLE `Feedback` (
  `FeedbackID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `FeedbackText` text,
  `FeedbackType` varchar(50) DEFAULT NULL,
  `RevisionStatus` varchar(50) DEFAULT NULL,
  `ActionItem` text,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `CounselorOnlyComment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Feedback`
--

INSERT INTO `Feedback` (`FeedbackID`, `AppointmentID`, `FeedbackText`, `FeedbackType`, `RevisionStatus`, `ActionItem`, `Date`, `Time`, `CounselorOnlyComment`) VALUES
(1000, 1, 'Resume improved significantly.', 'Resume', 'Completed', 'Revise resume layout.', '2025-05-01', '11:00:00', 'Strong progress.'),
(1001, 2, 'Good mock interview.', 'Interview', 'Pending Revision', 'Practice more STAR examples.', '2025-05-02', '12:00:00', 'Needs slight improvement.'),
(1002, 3, 'Marketing path clear.', 'Career Planning', 'Completed', 'Pursue PR internship.', '2025-05-03', '14:00:00', 'Solid plan.'),
(1003, 4, 'Analytics course suggested.', 'Career Coaching', 'Completed', 'Complete Tableau course.', '2025-05-04', '15:00:00', 'Very motivated student.'),
(1004, 5, 'Banking career roadmap.', 'Career Planning', 'Completed', 'Network with alumni.', '2025-05-05', '10:00:00', 'Excellent networking skills.'),
(1005, 6, 'Project management insights.', 'Interview', 'Completed', 'Enroll in PMP training.', '2025-05-06', '11:00:00', 'Good leadership potential.'),
(1006, 7, 'Accounting career focus.', 'Resume', 'Pending Revision', 'Attend career fair.', '2025-05-07', '12:00:00', 'Needs proactive effort.'),
(1007, 8, 'Consulting prep started.', 'Interview', 'Completed', 'Practice 5 cases.', '2025-05-08', '14:00:00', 'Steady improvement.'),
(1008, 9, 'Entrepreneurship pathway.', 'Career Coaching', 'Completed', 'Research accelerators.', '2025-05-09', '16:00:00', 'Highly innovative ideas.'),
(1009, 10, 'International resume advice.', 'Resume', 'Completed', 'Polish LinkedIn profile.', '2025-05-10', '17:00:00', 'Strong global vision.');

-- --------------------------------------------------------

--
-- Table structure for table `FileUpload`
--

CREATE TABLE `FileUpload` (
  `FileID` int NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `FileType` enum('Resume','Transcript','Certificate','FeedbackDocument') DEFAULT NULL,
  `UploadDate` date DEFAULT NULL,
  `Visibility` enum('Private','Public') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `FileUpload`
--

INSERT INTO `FileUpload` (`FileID`, `StudentID`, `FileType`, `UploadDate`, `Visibility`) VALUES
(1, 'GW2409871', 'Resume', '2025-04-15', 'Private'),
(2, 'GW2583871', 'Transcript', '2025-04-16', 'Private'),
(3, 'GW2119081', 'Resume', '2025-04-17', 'Public'),
(4, 'GW2567801', 'Certificate', '2025-04-18', 'Private'),
(5, 'GW2378689', 'Resume', '2025-04-19', 'Public'),
(6, 'GW2687279', 'Transcript', '2025-04-20', 'Private'),
(7, 'GW2609089', 'Resume', '2025-04-21', 'Public'),
(8, 'GW1654849', 'FeedbackDocument', '2025-04-22', 'Private'),
(9, 'GW2547865', 'Certificate', '2025-04-23', 'Public'),
(10, 'GW2597640', 'Resume', '2025-04-24', 'Private');

-- --------------------------------------------------------

--
-- Table structure for table `PerformanceReport`
--

CREATE TABLE `PerformanceReport` (
  `ReportID` int NOT NULL,
  `CounselorID` int NOT NULL,
  `GeneratedDate` date DEFAULT NULL,
  `AvgRating` decimal(3,2) DEFAULT NULL,
  `TopStrengths` text,
  `AreasForImprovement` text,
  `Summary` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `PerformanceReport`
--

INSERT INTO `PerformanceReport` (`ReportID`, `CounselorID`, `GeneratedDate`, `AvgRating`, `TopStrengths`, `AreasForImprovement`, `Summary`) VALUES
(1, 100, '2025-05-15', 4.80, 'Resume editing, strategic career advice.', 'Expand mock interview content.', 'Overall strong client rapport.'),
(2, 101, '2025-05-15', 4.60, 'Technical interview coaching.', 'Broaden industry examples.', 'Excellent engagement with tech students.'),
(3, 102, '2025-05-15', 4.90, 'Marketing career paths.', 'Enhance digital marketing content.', 'Very high student satisfaction.'),
(4, 103, '2025-05-15', 4.70, 'Analytics pathway guidance.', 'Suggest more certifications.', 'Students appreciate practical advice.'),
(5, 104, '2025-05-15', 4.80, 'Banking and finance advising.', 'Expand into private equity.', 'Effective finance mentoring.'),
(6, 105, '2025-05-15', 4.50, 'Leadership coaching.', 'More case study discussions.', 'High potential development support.'),
(7, 106, '2025-05-15', 4.90, 'Accounting career prep.', 'Expand CPA pathways.', 'Strong accounting student mentorship.'),
(8, 107, '2025-05-15', 4.60, 'Consulting case interview skills.', 'More practice session slots.', 'Excellent case prep support.'),
(9, 108, '2025-05-15', 4.70, 'Entrepreneurship coaching.', 'Deepen funding advice.', 'Highly inspirational sessions.'),
(10, 109, '2025-05-15', 4.80, 'International career navigation.', 'More language resources.', 'Outstanding global advising.');

-- --------------------------------------------------------

--
-- Table structure for table `ReviewLog`
--

CREATE TABLE `ReviewLog` (
  `ReviewID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `ReviewComment` text,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ReviewLog`
--

INSERT INTO `ReviewLog` (`ReviewID`, `AppointmentID`, `Rating`, `ReviewComment`, `Date`) VALUES
(1011, 1, 5.00, 'Very helpful session.', '2025-05-01'),
(1012, 2, 4.50, 'Good feedback but needed more depth.', '2025-05-02'),
(1013, 3, 5.00, 'Excellent career advice.', '2025-05-03'),
(1014, 4, 5.00, 'Very informative session.', '2025-05-04'),
(1015, 5, 5.00, 'Actionable guidance provided.', '2025-05-05'),
(1016, 6, 4.20, 'Helpful but follow-up needed.', '2025-05-06'),
(1017, 7, 5.00, 'Encouraging and clear.', '2025-05-07'),
(1018, 8, 4.10, 'Helpful, need more examples.', '2025-05-08'),
(1019, 9, 5.00, 'Great entrepreneurship tips.', '2025-05-09'),
(1020, 10, 5.00, 'Outstanding international career advice.', '2025-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `Skill`
--

CREATE TABLE `Skill` (
  `SkillID` int NOT NULL,
  `SkillName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Skill`
--

INSERT INTO `Skill` (`SkillID`, `SkillName`) VALUES
(2001, 'Data Analysis'),
(2002, 'Public Speaking'),
(2003, 'Python Programming'),
(2004, 'Project Management'),
(2005, 'Financial Modeling'),
(2006, 'Digital Marketing'),
(2007, 'Business Strategy'),
(2008, 'Cloud Computing'),
(2009, 'Leadership'),
(2010, 'SQL Database');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StudentID` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  `Program` varchar(100) DEFAULT NULL,
  `ProfileSummary` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`StudentID`, `Name`, `Email`, `PhoneNo`, `Program`, `ProfileSummary`) VALUES
('GW1654849', 'Ivy Wilson', 'ivy.wilson@gwu.edu', '2025550109', 'MSIS', 'Data security advocate.'),
('GW2119081', 'Carol White', 'carol.white@gwu.edu', '2025550103', 'BBA', 'Marketing enthusiast.'),
('GW2378689', 'Frank Black', 'frank.black@gwu.edu', '2025550106', 'MSBA', 'Business analytics explorer.'),
('GW2409871', 'Alice Johnson', 'alice.johnson@gwu.edu', '2025550101', 'MBA', 'Aspiring finance leader.'),
('GW2547865', 'Henry Adams', 'henry.adams@gwu.edu', '2025550108', 'BBA', 'Marketing strategist.'),
('GW2567801', 'David Brown', 'david.brown@gwu.edu', '2025550104', 'MBA', 'Sustainability advocate.'),
('GW2583871', 'Bob Smith', 'bob.smith@gwu.edu', '2025550102', 'MSIST', 'Passionate about tech innovation.'),
('GW2597640', 'Grace Lee', 'grace.lee@gwu.edu', '2025550107', 'MBA', 'Entrepreneurial mindset.'),
('GW2609089', 'Jack Martinez', 'jack.martinez@gwu.edu', '2025550110', 'MSPM', 'Project management expert.'),
('GW2687279', 'Eva Green', 'eva.green@gwu.edu', '2025550105', 'MSF', 'Investment banking aspirant.');

-- --------------------------------------------------------

--
-- Table structure for table `StudentCareer`
--

CREATE TABLE `StudentCareer` (
  `StudentID` varchar(10) NOT NULL,
  `CareerID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `StudentCareer`
--

INSERT INTO `StudentCareer` (`StudentID`, `CareerID`) VALUES
('GW2409871', 3001),
('GW2583871', 3002),
('GW2119081', 3003),
('GW2567801', 3004),
('GW2378689', 3005),
('GW2687279', 3006),
('GW2609089', 3007),
('GW1654849', 3008),
('GW2547865', 3009),
('GW2597640', 3010);

-- --------------------------------------------------------

--
-- Table structure for table `StudentSkill`
--

CREATE TABLE `StudentSkill` (
  `StudentID` varchar(10) NOT NULL,
  `SkillID` int NOT NULL,
  `SkillLevel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `StudentSkill`
--

INSERT INTO `StudentSkill` (`StudentID`, `SkillID`, `SkillLevel`) VALUES
('GW1654849', 2008, 'Intermediate'),
('GW2119081', 2003, 'Advanced'),
('GW2378689', 2005, 'Intermediate'),
('GW2409871', 2001, 'Advanced'),
('GW2547865', 2009, 'Expert'),
('GW2567801', 2004, 'Expert'),
('GW2583871', 2002, 'Intermediate'),
('GW2597640', 2010, 'Advanced'),
('GW2609089', 2007, 'Advanced'),
('GW2687279', 2006, 'Beginner');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_appointmentdetails`
-- (See below for the actual view)
--
CREATE TABLE `vw_appointmentdetails` (
`AppointmentID` int
,`StudentName` varchar(100)
,`CounselorName` varchar(100)
,`Date` date
,`Time` time
,`AppointmentType` varchar(50)
,`Mode` enum('In-Person','Virtual')
,`Status` enum('Confirmed','Pending','Denied')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_studentprofiles`
-- (See below for the actual view)
--
CREATE TABLE `vw_studentprofiles` (
`StudentID` varchar(10)
,`Name` varchar(100)
,`Program` varchar(100)
,`Skills` text
,`CareerInterests` text
);

-- --------------------------------------------------------

--
-- Structure for view `vw_appointmentdetails`
--
DROP TABLE IF EXISTS `vw_appointmentdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_appointmentdetails`  AS SELECT `a`.`AppointmentID` AS `AppointmentID`, `s`.`Name` AS `StudentName`, `c`.`CounselorName` AS `CounselorName`, `a`.`Date` AS `Date`, `a`.`Time` AS `Time`, `a`.`AppointmentType` AS `AppointmentType`, `a`.`Mode` AS `Mode`, `a`.`Status` AS `Status` FROM ((`appointmentsession` `a` join `student` `s` on((`a`.`StudentID` = `s`.`StudentID`))) join `counselor` `c` on((`a`.`CounselorID` = `c`.`CounselorID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_studentprofiles`
--
DROP TABLE IF EXISTS `vw_studentprofiles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_studentprofiles`  AS SELECT `s`.`StudentID` AS `StudentID`, `s`.`Name` AS `Name`, `s`.`Program` AS `Program`, group_concat(`sk`.`SkillName` separator ',') AS `Skills`, group_concat(`ci`.`CareerName` separator ',') AS `CareerInterests` FROM ((((`student` `s` left join `studentskill` `ss` on((`s`.`StudentID` = `ss`.`StudentID`))) left join `skill` `sk` on((`ss`.`SkillID` = `sk`.`SkillID`))) left join `studentcareer` `sc` on((`s`.`StudentID` = `sc`.`StudentID`))) left join `careerinterest` `ci` on((`sc`.`CareerID` = `ci`.`CareerID`))) GROUP BY `s`.`StudentID`, `s`.`Name`, `s`.`Program` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AIMatchRecommendation`
--
ALTER TABLE `AIMatchRecommendation`
  ADD PRIMARY KEY (`StudentID`,`CounselorID`),
  ADD KEY `AIMatchRecommendation_FK2` (`CounselorID`);

--
-- Indexes for table `AppointmentSession`
--
ALTER TABLE `AppointmentSession`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `AppointmentSession_FK1` (`StudentID`),
  ADD KEY `idx_counselor_appointment` (`CounselorID`);

--
-- Indexes for table `CareerInterest`
--
ALTER TABLE `CareerInterest`
  ADD PRIMARY KEY (`CareerID`);

--
-- Indexes for table `Counselor`
--
ALTER TABLE `Counselor`
  ADD PRIMARY KEY (`CounselorID`);

--
-- Indexes for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `Feedback_FK1` (`AppointmentID`);

--
-- Indexes for table `FileUpload`
--
ALTER TABLE `FileUpload`
  ADD PRIMARY KEY (`FileID`),
  ADD KEY `FileUpload_FK1` (`StudentID`);

--
-- Indexes for table `PerformanceReport`
--
ALTER TABLE `PerformanceReport`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `PerformanceReport_FK1` (`CounselorID`);

--
-- Indexes for table `ReviewLog`
--
ALTER TABLE `ReviewLog`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ReviewLog_FK1` (`AppointmentID`);

--
-- Indexes for table `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`SkillID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `StudentCareer`
--
ALTER TABLE `StudentCareer`
  ADD PRIMARY KEY (`StudentID`,`CareerID`),
  ADD KEY `StudentCareer_FK2` (`CareerID`);

--
-- Indexes for table `StudentSkill`
--
ALTER TABLE `StudentSkill`
  ADD PRIMARY KEY (`StudentID`,`SkillID`),
  ADD KEY `StudentSkill_FK2` (`SkillID`),
  ADD KEY `idx_student_skill` (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AIMatchRecommendation`
--
ALTER TABLE `AIMatchRecommendation`
  ADD CONSTRAINT `AIMatchRecommendation_FK1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `AIMatchRecommendation_FK2` FOREIGN KEY (`CounselorID`) REFERENCES `Counselor` (`CounselorID`);

--
-- Constraints for table `AppointmentSession`
--
ALTER TABLE `AppointmentSession`
  ADD CONSTRAINT `AppointmentSession_FK1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `AppointmentSession_FK2` FOREIGN KEY (`CounselorID`) REFERENCES `Counselor` (`CounselorID`);

--
-- Constraints for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `Feedback_FK1` FOREIGN KEY (`AppointmentID`) REFERENCES `AppointmentSession` (`AppointmentID`);

--
-- Constraints for table `FileUpload`
--
ALTER TABLE `FileUpload`
  ADD CONSTRAINT `FileUpload_FK1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

--
-- Constraints for table `PerformanceReport`
--
ALTER TABLE `PerformanceReport`
  ADD CONSTRAINT `PerformanceReport_FK1` FOREIGN KEY (`CounselorID`) REFERENCES `Counselor` (`CounselorID`);

--
-- Constraints for table `ReviewLog`
--
ALTER TABLE `ReviewLog`
  ADD CONSTRAINT `ReviewLog_FK1` FOREIGN KEY (`AppointmentID`) REFERENCES `AppointmentSession` (`AppointmentID`);

--
-- Constraints for table `StudentCareer`
--
ALTER TABLE `StudentCareer`
  ADD CONSTRAINT `StudentCareer_FK1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `StudentCareer_FK2` FOREIGN KEY (`CareerID`) REFERENCES `CareerInterest` (`CareerID`);

--
-- Constraints for table `StudentSkill`
--
ALTER TABLE `StudentSkill`
  ADD CONSTRAINT `StudentSkill_FK1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `StudentSkill_FK2` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`SkillID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
