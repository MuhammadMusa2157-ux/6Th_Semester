-- ElectionProject/database/voting_system.sql

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `voting_system_db`;
USE `voting_system_db`;

-- Drop tables if they exist to allow for clean re-creation
DROP TABLE IF EXISTS `votes`;
DROP TABLE IF EXISTS `candidates`;
DROP TABLE IF EXISTS `election_officials`;
DROP TABLE IF EXISTS `polling_stations`;
DROP TABLE IF EXISTS `voters`;
DROP TABLE IF EXISTS `elections`;

-- Table for Elections
CREATE TABLE `elections` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `election_type` VARCHAR(100) NOT NULL, -- e.g., 'Presidential', 'Parliamentary', 'Local'
    `election_name` VARCHAR(255) NOT NULL UNIQUE,
    `election_date` DATE NOT NULL,
    `description` TEXT,
    `is_active` BOOLEAN NOT NULL DEFAULT TRUE, -- To indicate if election is open for voting
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Voters (using 'users' as a common Laravel convention, or 'voters')
-- We'll call it 'voters' to directly match your ERD entity name
CREATE TABLE `voters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `voter_registration_date` DATE NOT NULL DEFAULT CURRENT_DATE,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL, -- Storing hashed passwords
    `regular_voter_status` VARCHAR(50) DEFAULT 'Active', -- CHECK (Regular_Voter_Status IN ('Active', 'Inactive', 'Suspended')) -- MySQL doesn't directly enforce CHECK, apply logic in backend
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Polling Stations
CREATE TABLE `polling_stations` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `station_name` VARCHAR(255) NOT NULL,
    `station_location` VARCHAR(255) NOT NULL UNIQUE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Election Officials
CREATE TABLE `election_officials` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL, -- Storing hashed passwords
    `official_role` VARCHAR(100) NOT NULL, -- e.g., 'Presiding Officer', 'Clerk'
    `official_certification` TEXT,
    `station_id` INT, -- An official manages one polling station (many-to-one)
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`station_id`) REFERENCES `polling_stations`(`id`) ON DELETE SET NULL -- If station is deleted, official can be unassigned
);

-- Table for Candidates
CREATE TABLE `candidates` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `election_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `party` VARCHAR(255),
    `bio` TEXT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`election_id`) REFERENCES `elections`(`id`) ON DELETE CASCADE
);

-- Table for Votes
-- This table captures the specific vote cast by a voter in an election for a candidate.
-- It also includes the verification status as per your ER diagram.
CREATE TABLE `votes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `voter_id` INT NOT NULL,
    `election_id` INT NOT NULL,
    `candidate_id` INT NOT NULL,
    `vote_timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `verification_status` VARCHAR(50) DEFAULT 'Pending', -- CHECK (Verification_Status IN ('Verified', 'Invalid', 'Pending'))
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (`voter_id`, `election_id`), -- Ensures a voter can only vote once per election
    FOREIGN KEY (`voter_id`) REFERENCES `voters`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`election_id`) REFERENCES `elections`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`candidate_id`) REFERENCES `candidates`(`id`) ON DELETE CASCADE
);

-- Sample Data Population (Optional, for testing purposes)

INSERT INTO `polling_stations` (`station_name`, `station_location`) VALUES
('Central Hall Voting', '123 Main St, Cityville'),
('Community Center Booth', '456 Oak Ave, Townsville');

-- Note: Passwords below are 'password123' and 'officialpass' respectively, hashed using bcrypt (Laravel's default)
-- You'll need to run `php artisan tinker` and `bcrypt('your_password')` to get actual hashes
-- For now, we'll use a placeholder. In Laravel, you'd use `Hash::make()`
INSERT INTO `voters` (`name`, `email`, `password`, `regular_voter_status`) VALUES
('John Doe', 'john.doe@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Active'), -- password: password
('Jane Smith', 'jane.smith@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Active'); -- password: password

INSERT INTO `election_officials` (`name`, `email`, `password`, `official_role`, `official_certification`, `station_id`) VALUES
('Alice Official', 'alice.official@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Presiding Officer', 'Certified Election Official', 1), -- password: password
('Bob Clerk', 'bob.clerk@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Clerk', 'Certified Election Official', 2); -- password: password

INSERT INTO `elections` (`election_type`, `election_name`, `election_date`, `description`, `is_active`) VALUES
('Presidential', 'National Presidential Election 2025', '2025-11-04', 'Election for the President of the country.', TRUE),
('Local Council', 'City Council Election 2025', '2025-10-15', 'Election for local city council members.', TRUE);

INSERT INTO `candidates` (`election_id`, `name`, `party`, `bio`) VALUES
(1, 'Candidate A', 'Innovation Party', 'Focused on economic growth.'),
(1, 'Candidate B', 'Green Future', 'Advocating for environmental policies.'),
(2, 'Candidate X', 'Community First', 'Dedicated to local improvements.'),
(2, 'Candidate Y', 'Urban Dynamics', 'Committed to city development.');
