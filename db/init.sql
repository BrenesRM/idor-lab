-- Check if the database exists before creating it
CREATE DATABASE IF NOT EXISTS idor_lab;

-- Use the database
USE idor_lab;

-- Create the `users` table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, 
    role VARCHAR(20) NOT NULL
);

-- Insert sample data if the table is empty
INSERT INTO users (username, email, password_hash, role)
SELECT 'admin', 'admin@example.com', '$2y$10$T6hrzIkUtuhZ91e0XdP4/.yY3tP2N0qC0vlD4/vw2P0Q.q2cYeM1a.', 'administrator' 
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'admin');

INSERT INTO users (username, email, password_hash, role)
SELECT 'user1', 'user1@example.com', '$2y$10$T6hrzIkUtuhZ91e0XdP4/.yY3tP2N0qC0vlD4/vw2P0Q.q2cYeM2b.', 'regular_user' 
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'user1');

INSERT INTO users (username, email, password_hash, role)
SELECT 'user2', 'user2@example.com', '$2y$10$T6hrzIkUtuhZ91e0XdP4/.yY3tP2N0qC0vlD4/vw2P0Q.q2cYeM3c.', 'regular_user' 
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'user2');

INSERT INTO users (username, email, password_hash, role)
SELECT 'guest', 'guest@example.com', '$2y$10$T6hrzIkUtuhZ91e0XdP4/.yY3tP2N0qC0vlD4/vw2P0Q.q2cYeM4d.', 'guest' 
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'guest');
