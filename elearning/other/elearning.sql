-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 26, 2025 at 10:05 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `certificate_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `userID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `courseID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `testID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `certificate_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `lesson_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `comment_text` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `completed_lessons`
--

CREATE TABLE `completed_lessons` (
  `lesson_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `completed_lessons` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT '[]',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `course_name` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `course_description` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `course_image_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `demo_URL` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `overview` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `instructor_name` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `instructor_image` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `about_instructor` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(225) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'draft',
  `rating` float NOT NULL DEFAULT '0',
  `is_popular` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `review_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` float NOT NULL,
  `review_text` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `draft_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `userID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `courseID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `lesson_title` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `video_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `duration` float NOT NULL DEFAULT '0',
  `isCompleted` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `moduleID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `module_title` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCompleted` tinyint(1) DEFAULT '0',
  `courseID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `question_text` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `options` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `correct_option` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quizID` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `testID` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `moduleID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_courses`
--

CREATE TABLE `saved_courses` (
  `user_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `timeLimit` int NOT NULL,
  `courseID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_status`
--

CREATE TABLE `test_status` (
  `status_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `userID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `testID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `courseID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `startTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_token` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(225) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `status` varchar(225) COLLATE utf8mb4_general_ci DEFAULT 'active',
  `user_profileImage` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `failed_attempts` int DEFAULT '0',
  `last_failed_attempt` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_token`, `role`, `status`, `user_profileImage`, `failed_attempts`, `last_failed_attempt`, `created_at`, `user_email`) VALUES
('', 'admin', '$2b$10$qtKJh8q3ql2NM52.beEo7.vjaHJxlq7ADFD1NYFGRHT53Vqb0.p2u', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIiLCJpYXQiOjE3NDI5ODI0NzksImV4cCI6MTc0MzA2ODg3OX0.0fGRieKwJi-dL7mC9XKxjp4ezfuUw-IMbYnOHtV7u0Q', 'admin', 'active', NULL, 0, NULL, '2025-03-26 09:39:48', NULL),
('jcyi8sw8ug3d3xcatarw3c1i', 'user', '$2b$10$qtKJh8q3ql2NM52.beEo7.vjaHJxlq7ADFD1NYFGRHT53Vqb0.p2u', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJqY3lpOHN3OHVnM2QzeGNhdGFydzNjMWkiLCJpYXQiOjE3NDI5ODI0MDAsImV4cCI6MTc0MzA2ODgwMH0.jufoOTvKVkKpwdm-q4zArGRGujn0j8V30hud4NKeL9w', 'user', 'active', NULL, 0, NULL, '2025-03-26 09:39:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_attempts`
--

CREATE TABLE `user_attempts` (
  `attempt_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `userID` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `quizID` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `testID` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attemptNumber` int NOT NULL DEFAULT '1',
  `score` float NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `user_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `is_completed` tinyint(1) DEFAULT '0',
  `progress` float DEFAULT '0',
  `enrolled_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `report_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `contents` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificate_id`),
  ADD KEY `certificates_userID_users_user_id_fk` (`userID`),
  ADD KEY `certificates_courseID_courses_course_id_fk` (`courseID`),
  ADD KEY `certificates_testID_tests_test_id_fk` (`testID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comments_lesson_id_lessons_lesson_id_fk` (`lesson_id`),
  ADD KEY `comments_user_id_users_user_id_fk` (`user_id`);

--
-- Indexes for table `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `completed_lessons_user_id_users_user_id_fk` (`user_id`),
  ADD KEY `completed_lessons_course_id_courses_course_id_fk` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `course_reviews_course_id_courses_course_id_fk` (`course_id`),
  ADD KEY `course_reviews_user_id_users_user_id_fk` (`user_id`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`draft_id`),
  ADD KEY `draft_userID_users_user_id_fk` (`userID`),
  ADD KEY `draft_courseID_courses_course_id_fk` (`courseID`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `lessons_moduleID_modules_module_id_fk` (`moduleID`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `modules_courseID_courses_course_id_fk` (`courseID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions_quizID_quizzes_quiz_id_fk` (`quizID`),
  ADD KEY `questions_testID_tests_test_id_fk` (`testID`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `quizzes_moduleID_modules_module_id_fk` (`moduleID`);

--
-- Indexes for table `saved_courses`
--
ALTER TABLE `saved_courses`
  ADD KEY `saved_courses_user_id_users_user_id_fk` (`user_id`),
  ADD KEY `saved_courses_course_id_courses_course_id_fk` (`course_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `tests_courseID_courses_course_id_fk` (`courseID`);

--
-- Indexes for table `test_status`
--
ALTER TABLE `test_status`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `test_status_userID_users_user_id_fk` (`userID`),
  ADD KEY `test_status_testID_tests_test_id_fk` (`testID`),
  ADD KEY `test_status_courseID_courses_course_id_fk` (`courseID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_attempts`
--
ALTER TABLE `user_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `user_attempts_userID_users_user_id_fk` (`userID`),
  ADD KEY `user_attempts_quizID_quizzes_quiz_id_fk` (`quizID`),
  ADD KEY `user_attempts_testID_tests_test_id_fk` (`testID`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD KEY `user_courses_user_id_users_user_id_fk` (`user_id`),
  ADD KEY `user_courses_course_id_courses_course_id_fk` (`course_id`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_lesson_id_lessons_lesson_id_fk` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD CONSTRAINT `completed_lessons_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `completed_lessons_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD CONSTRAINT `course_reviews_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_reviews_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `draft`
--
ALTER TABLE `draft`
  ADD CONSTRAINT `draft_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `draft_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_moduleID_modules_module_id_fk` FOREIGN KEY (`moduleID`) REFERENCES `modules` (`module_id`) ON DELETE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quizID_quizzes_quiz_id_fk` FOREIGN KEY (`quizID`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_moduleID_modules_module_id_fk` FOREIGN KEY (`moduleID`) REFERENCES `modules` (`module_id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_courses`
--
ALTER TABLE `saved_courses`
  ADD CONSTRAINT `saved_courses_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_courses_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `test_status`
--
ALTER TABLE `test_status`
  ADD CONSTRAINT `test_status_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_status_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_status_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_attempts`
--
ALTER TABLE `user_attempts`
  ADD CONSTRAINT `user_attempts_quizID_quizzes_quiz_id_fk` FOREIGN KEY (`quizID`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_attempts_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_attempts_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_courses_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
