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

INSERT INTO users 
  (first_name, last_name, username, email)
VALUES 
  ('Alex', 'Jones', 'alexj', 'alex.jones@example.com');
  ('Charlie', 'Kirk', 'CK', 'C.K@email.com');

INSERT INTO passwords
  (user_id, website_name, url, password, comment)
VALUES
  (1, 'MySQL', 'https://www.mysql.com', AES_ENCRYPT('Tiger123!', 'dbkey'), 'Database account'),
  (1, 'GitHub', 'https://github.com', AES_ENCRYPT('Dragon456!', 'dbkey'), 'Code repository'),
  (1, 'Discord', 'https://discord.com', AES_ENCRYPT('Fox789!', 'dbkey'), 'Chat account'),
  (1, 'Wikipedia', 'https://www.wikipedia.org', AES_ENCRYPT('Bear321!', 'dbkey'), 'Reference account'),
  (1, 'Example', 'http://example.com', AES_ENCRYPT('Cat654!', 'dbkey'), 'Testing account'),
  (1, 'Reddit', 'https://www.reddit.com', AES_ENCRYPT('Wolf987!', 'dbkey'), 'Forum account'),
  (1, 'Stack Overflow', 'https://stackoverflow.com', AES_ENCRYPT('Hawk111!', 'dbkey'), 'Programming account'),
  (1, 'OpenAI', 'https://openai.com', AES_ENCRYPT('Lion222!', 'dbkey'), 'AI account'),
  (1, 'Test Site', 'http://testsite.com', AES_ENCRYPT('Panda333!', 'dbkey'), 'Test website'),
  (1, 'Sample App', 'http://sampleapp.com', AES_ENCRYPT('Rabbit444!', 'dbkey'), 'Sample application');