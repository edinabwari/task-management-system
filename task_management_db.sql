-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 03:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `recipient` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `recipient`, `type`, `date`, `is_read`) VALUES
(20, '\'Tiytdv\' has been assigned to you. Please review and start working on it', 11, 'New Task Assigned', '2025-07-12', 0),
(21, '\'Sales Target\' has been assigned to you. Please review and start working on it', 13, 'New Task Assigned', '2025-07-12', 0),
(22, '\'Logistics Fuel Tracking Report\' has been assigned to you. Please review and start working on it', 4, 'New Task Assigned', '2025-07-12', 0),
(23, '\'Print Documents\' has been assigned to you. Please review and start working on it', 14, 'New Task Assigned', '2025-07-13', 0),
(24, '\'Print Documents\' has been assigned to you. Please review and start working on it', 14, 'New Task Assigned', '2025-07-13', 0),
(25, '\'Meeting Minutes\' has been assigned to you. Please review and start working on it', 3, 'New Task Assigned', '2025-07-13', 0),
(26, '\'Website Content Review\' has been assigned to you. Please review and start working on it', 6, 'New Task Assigned', '2025-07-13', 0),
(27, '\'Social Media Post Creation\' has been assigned to you. Please review and start working on it', 6, 'New Task Assigned', '2025-07-13', 0),
(28, '\'Data Entry Task\' has been assigned to you. Please review and start working on it', 4, 'New Task Assigned', '2025-07-13', 0),
(29, '\'Market Research\' has been assigned to you. Please review and start working on it', 4, 'New Task Assigned', '2025-07-13', 0),
(30, '\'Inventory Check\' has been assigned to you. Please review and start working on it', 4, 'New Task Assigned', '2025-07-13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `assigned_to`, `due_date`, `status`, `created_at`) VALUES
(1, 'Print Documents', 'Kindly print the internal memo shared via email and stick them on the noticeboard', 3, '2025-07-17', 'pending', '2025-07-12 23:29:10'),
(2, 'Print Documents', 'Kindly print the internal memo shared via email and stick them on the noticeboard', 3, '2025-07-17', 'in_progress', '2025-07-12 23:30:15'),
(3, 'Meeting Minutes', 'Attend the team meeting, take notes on key decisions, and share a summary with action items.', 3, '2025-07-25', 'pending', '2025-07-13 00:47:35'),
(4, 'Website Content Review', 'Review the homepage content for spelling/grammar errors and suggest improvements for clarity.', 6, '2025-07-17', 'pending', '2025-07-13 00:59:49'),
(5, 'Social Media Post Creation', 'Create a short social media post promoting our latest product. Include an image suggestion.', 6, '2025-07-30', 'pending', '2025-07-13 01:00:56'),
(6, 'Data Entry Task', 'Enter the provided customer details into the Excel sheet, ensuring no duplicates and correct formatting.', 4, '2025-07-29', 'pending', '2025-07-13 01:01:45'),
(7, 'Market Research', 'Find our competitors in our industry and note down their pricing models. Summarize in 3-4 bullet points.', 4, '2025-08-07', 'pending', '2025-07-13 01:02:32'),
(8, 'Inventory Check', 'Verify stock levels for 10 key products and note any discrepancies in the system.', 4, '2025-07-19', 'pending', '2025-07-13 01:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employee') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Edina Bwari', 'admin', 'edinakwambokabwari@gmail.com', '$2y$10$TnyR1Y43m1EIWpb0MiwE8Ocm6rj0F2KojE3PobVfQDo9HYlAHY/7O', 'admin', '2024-08-28 07:10:04'),
(2, 'Edina Bwari', 'EdinaAdmin', 'edinakwambokabwari@gmail.com', '$2y$10$SuN66lm2BRPRcwp3v6oRy.ayv2rqV5oLhzYKArYUMwQeggVFfqNbG', 'admin', '2025-07-12 15:12:52'),
(3, 'Collins James', 'CollinsLogistics', 'collins@gmail.com', '$2y$10$Ol1P17Eq.Ikec99bSxVaued9vdp01QZs5ak/rMTI6k7hYYlw1INeS', 'employee', '2025-07-12 15:51:05'),
(4, 'Brighton Junior', 'BrightonSales', 'bwarikwambokaedina@gmail.com', '$2y$10$OP7IOrUac81fmfBVLwTrXeNHiOHgxN41lDr5t8DmGlZ2p7YvuMUyK', 'employee', '2025-07-12 21:59:18'),
(6, 'Summer Bloom', 'BloomHr', 'Bloom@gmail.com', '$2y$10$.saGpiHggKSkK/rYOHPDu.qRTAW/r4Zar1rLhHDMGzVibXzhPKw1u', 'employee', '2025-07-13 00:42:05'),
(7, 'Haven Bright', 'HavenIntern', 'Haven@gmail.com', '$2y$10$aD06oRMGcD3IbCmONo2CWeHGvlWvACQtDOrOr6.X0LNGH1fMTGQKe', 'employee', '2025-07-13 01:10:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
