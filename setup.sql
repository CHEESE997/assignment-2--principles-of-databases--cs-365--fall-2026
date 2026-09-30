DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords;
USE passwords;

CREATE TABLE IF NOT EXISTS website (
    websiteID INT AUTO_INCREMENT PRIMARY KEY,
    websiteName VARCHAR(150),
    websiteURL VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS user (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    username VARCHAR(150),
    email VARCHAR(256)
);