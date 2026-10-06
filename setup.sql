DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords;
USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('123Blue321', 512));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS website (
    websiteID INT AUTO_INCREMENT,
    websiteName VARCHAR(150) NOT NULL,
    websiteURL VARCHAR(256) NOT NULL,

    PRIMARY KEY (websiteID)
);

CREATE TABLE IF NOT EXISTS user (
    userID INT AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    username VARCHAR(150) NOT NULL,
    email VARCHAR(256) NOT NULL,

    PRIMARY KEY (userID)
);

CREATE TABLE IF NOT EXISTS login (
    loginID INT AUTO_INCREMENT,
    userID INT NOT NULL,
    websiteID INT NOT NULL,
    password VARBINARY(512) NOT NULL,
    comment VARCHAR(200),
    timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (userID) REFERENCES user(userID),
    FOREIGN KEY (websiteID) REFERENCES website(websiteID),

    PRIMARY KEY (loginID)
);

INSERT INTO website (websiteName, websiteURL)
VALUES
    ('Instagram', 'https://www.instagram.com/login'),
    ('Twitter', 'https://www.twitter.com/login'),
    ('Github', 'https://github.com/login'),
    ('Microsoft', 'https://login.microsoftonline.com/'),
    ('Discord', 'https://discord.com/login'),
    ('Youtube', 'https://www.youtube.com/'),
    ('Amazon', 'https://www.amazon.com/'),
    ('Steam', 'https://stores.steampowered.com/login/'),
    ('Pinterest', 'https://www.pinterest.com/login/'),
    ('Valorant', 'https://auth.riotgames.com/');

INSERT INTO user (firstName, lastName, username, email)
VALUES 
    ('Cameron', 'Brown', 'CamDaBomb', 'CamBrown@gmail.com'),
    ('Sam', 'Collins', 'SamsFireArt', 'SamOnFire@yahoo.com'),
    ('Lori', 'Barker', 'Lori Bark', 'LorBark@yahoo.com'),
    ('Jordan', 'Lui', 'JLuiTech', 'JordanLui@outlook.com'),
    ('Mia', 'Carter', 'MiasBlues', 'MiaCarter@gmail.com'),
    ('Noah', 'Jobs', 'NoahVids', 'NoahJobs@yahoo.com'),
    ('Ava', 'Davis', 'AvaShopz', 'AvaDavis@outlook.com'),
    ('Ethan', 'Moore', '3thanGam3z', 'EthanMoore@gmail.com'),
    ('Chloe', 'Harris', 'ChloePinz', 'ChloeHarris@gmail.com'),
    ('Mason', 'Clark', 'Mason2DaRescue', 'MasonClark@icloud.com');

INSERT INTO login (userID, websiteID, password, comment, timestamp)
VALUES
    (1, 1, AES_ENCRYPT('Th3Cloudzfir3', @key_str, @init_vector), 'New Insta account.', '2024-02-12 17:24:18'),
    (2, 2, AES_ENCRYPT('Life1sg00d', @key_str, @init_vector), 'Twitter account for art.', '2017-07-17 19:07:00'),
    (3, 3, AES_ENCRYPT('CatsRC0t3', @key_str, @init_vector), 'Github account for personal use.', '2022-11-23 10:38:26'),
    (4, 4, AES_ENCRYPT('Sunset7Cloud!', @key_str, @init_vector), 'Microsoft account for school.', '2023-08-19 14:32:10'),
    (5, 5, AES_ENCRYPT('PurpleMoon!7', @key_str, @init_vector), 'Discord gaming account.', '2016-05-08 20:16:35'),
    (6, 6, AES_ENCRYPT('Video5tars!', @key_str, @init_vector), 'Youtube account for videos.', '2020-09-14 12:45:30'),
    (7, 7, AES_ENCRYPT('Hope4River9!', @key_str, @init_vector), 'Amazon shopping acccount.', '2019-12-03 09:21:15'),
    (8, 8, AES_ENCRYPT('Gamez4Life001!', @key_str, @init_vector), 'Steam gaming account.', '2025-06-25 18:37:50'),
    (9, 9, AES_ENCRYPT('Pinning4Flowerz67!', @key_str, @init_vector), 'Pinterest account for ideas.', '2018-04-11 16:08:22'),
    (10,10, AES_ENCRYPT('Agents401Fire', @key_str, @init_vector), 'Riot Valorant gaming account.', '2021-01-27 21:42:36');