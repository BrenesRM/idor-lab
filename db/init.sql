-- Check if the database exists before creating it
CREATE DATABASE IF NOT EXISTS idor_lab;

-- Use the database
USE idor_lab;

-- Create the `users` table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Insert sample data if the table is empty
INSERT INTO users (username, role)
SELECT 'admin', 'administrator'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'admin');
INSERT INTO users (username, role)
SELECT 'user1', 'regular_user'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'user1');
