SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('123Blue321', 512));

-- Creates a new entry into the database
INSERT INTO website(websiteName, websiteURL)
VALUES (
    'Quizlet',
    'https://quizlet.com/login'
);

INSERT INTO user(firstName, lastName, username, email)
VALUES (
    'Kate',
    'Sparks',
    'KatysSparksFly',
    'Katty07@icloud.com'
);

INSERT INTO login(websiteID, userID, password, comment, timestamp)
VALUES (
    11,
    11,
    AES_ENCRYPT('JustAnotherDiamondz', @key_str, @init_vector),
    'Quizlet account for studying.',
    '2026-05-25 04:37:08'
);

-- Gets the password associated with a URL
SELECT login.password 
FROM login
JOIN website
ON login.websiteID = website.websiteID
WHERE website.websiteURL = 'https://discord.com/login';

-- Gets all password-related data including the decrypted password
SELECT login.*,
    CAST(AES_DECRYPT(login.password, @key_str, @init_vector) AS CHAR) AS decryptedPassword
FROM login
JOIN website
ON login.websiteID = website.websiteID
WHERE (website.websiteName = 'Discord'
    OR website.websiteName = 'Valorant')
AND website.websiteURL LIKE 'https%';

-- Change a URL associated with one of the 10 passwords
UPDATE website
SET websiteURL = 'https://x.com/login'
WHERE websiteURL = 'https://www.twitter.com/login';

-- Change the password to any entry
UPDATE login
SET password = AES_ENCRYPT('Puupies4Lifers', @key_str, @init_vector)
WHERE websiteID = 6;

-- Remove a tuple based on a URL
DELETE login
FROM login
JOIN website
ON login.websiteID = website.websiteID
WHERE website.websiteURL = 'https://www.pinterest.com/login/';

-- Remove a tuple based on a password
DELETE FROM login
WHERE password = AES_ENCRYPT('Sunset7Cloud!', @key_str, @init_vector);