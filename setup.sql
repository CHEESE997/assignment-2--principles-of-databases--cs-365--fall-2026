DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

USE passwords;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE passwords (
    password_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    website_name VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL,
    password VARBINARY(255) NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (first_name, last_name, username, email)
VALUES ('Alex', 'Johnson', 'alexj', 'alex.johnson@example.com');

INSERT INTO passwords
    (user_id, website_name, url, password, comment)
VALUES
    (1, 'MySQL', 'https://www.mysql.com', AES_ENCRYPT('BlueTiger123!', 'dbkey'), 'Database account'),
    (1, 'GitHub', 'https://github.com', AES_ENCRYPT('RedDragon456!', 'dbkey'), 'Code repository'),
    (1, 'Discord', 'https://discord.com', AES_ENCRYPT('GreenFox789!', 'dbkey'), 'Chat account'),
    (1, 'Wikipedia', 'https://www.wikipedia.org', AES_ENCRYPT('YellowBear321!', 'dbkey'), 'Reference account'),
    (1, 'Example', 'http://example.com', AES_ENCRYPT('PurpleCat654!', 'dbkey'), 'Testing account'),
    (1, 'Reddit', 'https://www.reddit.com', AES_ENCRYPT('OrangeWolf987!', 'dbkey'), 'Forum account'),
    (1, 'Stack Overflow', 'https://stackoverflow.com', AES_ENCRYPT('SilverHawk111!', 'dbkey'), 'Programming account'),
    (1, 'OpenAI', 'https://openai.com', AES_ENCRYPT('GoldenLion222!', 'dbkey'), 'AI account'),
    (1, 'Test Site', 'http://testsite.com', AES_ENCRYPT('BlackPanda333!', 'dbkey'), 'Test website'),
    (1, 'Sample App', 'http://sampleapp.com', AES_ENCRYPT('WhiteRabbit444!', 'dbkey'), 'Sample application');