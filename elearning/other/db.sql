CREATE TABLE `users` (
	`user_id` varchar(225) NOT NULL,
	`user_name` varchar(225) NOT NULL,
	`user_password` varchar(225) NOT NULL,
	`user_token` varchar(250),
	`role` varchar(225) NOT NULL DEFAULT 'user',
	`status` varchar(225) DEFAULT 'active',
	`user_profileImage` varchar(225),
	`failed_attempts` int DEFAULT 0,
	`last_failed_attempt` timestamp,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `users_user_id` PRIMARY KEY(`user_id`)
);

CREATE TABLE `user_reports` (
	`report_id` varchar(225) NOT NULL,
	`subject` varchar(225) NOT NULL,
	`contents` varchar(225) NOT NULL,
	`user_id` varchar(225) NOT NULL,
	`admin_id` varchar(225),
	`is_read` boolean DEFAULT false,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `user_reports_report_id` PRIMARY KEY(`report_id`)
);

CREATE TABLE `courses` (
	`course_id` varchar(225) NOT NULL,
	`course_name` varchar(225) NOT NULL,
	`course_description` varchar(225) NOT NULL,
	`course_image_url` varchar(500) NOT NULL,
	`demo_URL` varchar(500) NOT NULL,
	`category` varchar(225) NOT NULL,
	`overview` varchar(225) NOT NULL,
	`instructor_name` varchar(225) NOT NULL,
	`instructor_image` varchar(500) NOT NULL,
	`about_instructor` varchar(225) NOT NULL,
	`status` varchar(225) NOT NULL DEFAULT 'draft',
	`rating` float NOT NULL DEFAULT 0,
	`is_popular` boolean DEFAULT false,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `courses_course_id` PRIMARY KEY(`course_id`)
);

CREATE TABLE `lessons` (
	`lesson_id` varchar(225) NOT NULL,
	`lesson_title` varchar(225) NOT NULL,
	`video_url` varchar(500) NOT NULL,
	`duration` float NOT NULL DEFAULT 0,
	`isCompleted` boolean DEFAULT false,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`moduleID` varchar(225) NOT NULL,
	CONSTRAINT `lessons_lesson_id` PRIMARY KEY(`lesson_id`)
);

CREATE TABLE `modules` (
	`module_id` varchar(225) NOT NULL,
	`module_title` varchar(225) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`isCompleted` boolean DEFAULT false,
	`courseID` varchar(225) NOT NULL,
	CONSTRAINT `modules_module_id` PRIMARY KEY(`module_id`)
);

CREATE TABLE `user_courses` (
	`user_id` varchar(225) NOT NULL,
	`course_id` varchar(225) NOT NULL,
	`is_completed` boolean DEFAULT false,
	`progress` float DEFAULT 0,
	`enrolled_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`last_updated` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `draft` (
	`draft_id` varchar(225) NOT NULL,
	`userID` varchar(225) NOT NULL,
	`courseID` varchar(225) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `draft_draft_id` PRIMARY KEY(`draft_id`)
);

CREATE TABLE `comments` (
	`comment_id` varchar(225) NOT NULL,
	`lesson_id` varchar(225) NOT NULL,
	`user_id` varchar(225) NOT NULL,
	`comment_text` varchar(225) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `comments_comment_id` PRIMARY KEY(`comment_id`)
);

CREATE TABLE `course_reviews` (
	`review_id` varchar(225) NOT NULL,
	`course_id` varchar(225) NOT NULL,
	`user_id` varchar(225) NOT NULL,
	`rating` float NOT NULL,
	`review_text` varchar(225),
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `course_reviews_review_id` PRIMARY KEY(`review_id`)
);

CREATE TABLE `quizzes` (
	`quiz_id` varchar(225) NOT NULL,
	`title` varchar(225) NOT NULL,
	`moduleID` varchar(225) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `quizzes_quiz_id` PRIMARY KEY(`quiz_id`)
);

CREATE TABLE `tests` (
	`test_id` varchar(225) NOT NULL,
	`title` varchar(225) NOT NULL,
	`timeLimit` int NOT NULL,
	`courseID` varchar(225) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `tests_test_id` PRIMARY KEY(`test_id`)
);

CREATE TABLE `test_status` (
	`status_id` varchar(225) NOT NULL,
	`userID` varchar(225) NOT NULL,
	`testID` varchar(225) NOT NULL,
	`courseID` varchar(225) NOT NULL,
	`startTime` timestamp DEFAULT CURRENT_TIMESTAMP,
	`expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `test_status_status_id` PRIMARY KEY(`status_id`)
);

CREATE TABLE `questions` (
	`question_id` varchar(225) NOT NULL,
	`question_text` varchar(225) NOT NULL,
	`options` varchar(225) NOT NULL,
	`correct_option` varchar(255) NOT NULL,
	`quizID` varchar(225),
	`testID` varchar(225),
	CONSTRAINT `questions_question_id` PRIMARY KEY(`question_id`)
);

CREATE TABLE `user_attempts` (
	`attempt_id` varchar(225) NOT NULL,
	`userID` varchar(225) NOT NULL,
	`quizID` varchar(225),
	`testID` varchar(225),
	`attemptNumber` int NOT NULL DEFAULT 1,
	`score` float NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `user_attempts_attempt_id` PRIMARY KEY(`attempt_id`)
);

CREATE TABLE `completed_lessons` (
	`lesson_id` varchar(225) NOT NULL,
	`user_id` varchar(255) NOT NULL,
	`course_id` varchar(255) NOT NULL,
	`completed_lessons` varchar(5000) DEFAULT '[]',
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `completed_lessons_lesson_id` PRIMARY KEY(`lesson_id`)
);

CREATE TABLE `saved_courses` (
	`user_id` varchar(255) NOT NULL,
	`course_id` varchar(255) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `certificates` (
	`certificate_id` varchar(225) NOT NULL,
	`userID` varchar(225) NOT NULL,
	`courseID` varchar(225) NOT NULL,
	`testID` varchar(225) NOT NULL,
	`score` float NOT NULL,
	`certificate_url` varchar(255) NOT NULL,
	`createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `certificates_certificate_id` PRIMARY KEY(`certificate_id`)
);

ALTER TABLE `lessons` ADD CONSTRAINT `lessons_moduleID_modules_module_id_fk` FOREIGN KEY (`moduleID`) REFERENCES `modules`(`module_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `modules` ADD CONSTRAINT `modules_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `user_courses` ADD CONSTRAINT `user_courses_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `user_courses` ADD CONSTRAINT `user_courses_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `draft` ADD CONSTRAINT `draft_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `draft` ADD CONSTRAINT `draft_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `comments` ADD CONSTRAINT `comments_lesson_id_lessons_lesson_id_fk` FOREIGN KEY (`lesson_id`) REFERENCES `lessons`(`lesson_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `comments` ADD CONSTRAINT `comments_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `course_reviews` ADD CONSTRAINT `course_reviews_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `course_reviews` ADD CONSTRAINT `course_reviews_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `quizzes` ADD CONSTRAINT `quizzes_moduleID_modules_module_id_fk` FOREIGN KEY (`moduleID`) REFERENCES `modules`(`module_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `tests` ADD CONSTRAINT `tests_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `test_status` ADD CONSTRAINT `test_status_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `test_status` ADD CONSTRAINT `test_status_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests`(`test_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `test_status` ADD CONSTRAINT `test_status_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `questions` ADD CONSTRAINT `questions_quizID_quizzes_quiz_id_fk` FOREIGN KEY (`quizID`) REFERENCES `quizzes`(`quiz_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `questions` ADD CONSTRAINT `questions_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests`(`test_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `user_attempts` ADD CONSTRAINT `user_attempts_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `user_attempts` ADD CONSTRAINT `user_attempts_quizID_quizzes_quiz_id_fk` FOREIGN KEY (`quizID`) REFERENCES `quizzes`(`quiz_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `user_attempts` ADD CONSTRAINT `user_attempts_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests`(`test_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `completed_lessons` ADD CONSTRAINT `completed_lessons_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `completed_lessons` ADD CONSTRAINT `completed_lessons_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `saved_courses` ADD CONSTRAINT `saved_courses_user_id_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `saved_courses` ADD CONSTRAINT `saved_courses_course_id_courses_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_userID_users_user_id_fk` FOREIGN KEY (`userID`) REFERENCES `users`(`user_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_courseID_courses_course_id_fk` FOREIGN KEY (`courseID`) REFERENCES `courses`(`course_id`) ON DELETE cascade ON UPDATE no action;
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_testID_tests_test_id_fk` FOREIGN KEY (`testID`) REFERENCES `tests`(`test_id`) ON DELETE cascade ON UPDATE no action;