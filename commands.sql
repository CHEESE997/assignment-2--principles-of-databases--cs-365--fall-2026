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

INSERT INTO password(websiteID, userID, password, comment, timestamp)
VALUES (
    11,
    11,
    AES_ENCRYPT('JustAnotherDiamondz', '123Blue321'),
    'Quizlet account for studying.',
    '2026-05-25 04:37:08'
);

-- Gets the password associated with a URL
SELECT password 
FROM password
JOIN website
ON password.websiteID = website.websiteID
WHERE website.websiteURL = 'https://discord.com/login';

-- Gets all password-related data including the decrypted password
SELECT password.*,
    CAST(AES_DECRYPT(password.password, '123Blue321') AS CHAR) AS decryptedPassword
FROM password
JOIN website
ON password.websiteID = website.websiteID
WHERE (website.websiteName = 'Discord'
    OR website.websiteName = 'Valorant')
AND website.websiteURL LIKE 'https%';

-- Change a URL associated with one of the 10 passwords
UPDATE website
SET websiteURL = 'https://x.com/login'
WHERE websiteURL = 'https://www.twitter.com/login';

-- Change the password to any entry
UPDATE password
SET password = AES_ENCRYPT('Puupies4Lifers', '123Blue321')
WHERE websiteID = 6;

-- Remove a tuple based on a URL
DELETE password
FROM password
JOIN website
ON password.websiteID = website.websiteID
WHERE website.websiteURL = 'https://www.pinterest.com/login/';

-- Remove a tuple based on a password
DELETE FROM password
WHERE password = AES_ENCRYPT('Sunset7Cloud!', '123Blue321');