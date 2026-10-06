-- create new entry
INSERT INTO passwords
    (user_id, website_name, url, password, comment)
VALUES
  (1, 'New Website', 'https://newsite.com',
    AES_ENCRYPT('NewFakePassword555!', 'dbkey'), 'New account');

-- retrieve password
SELECT
  website_name,
  url,
  CAST(AES_DECRYPT(password, 'dbkey') AS CHAR) AS password
FROM passwords
WHERE url = 'https://www.mysql.com';

-- Password related data
SELECT
  p.website_name,
  p.url,
  u.first_name,
  u.last_name,
  u.username,
  u.email,
  CAST(AES_DECRYPT(p.password, 'dbkey') AS CHAR) AS password,
  p.comment,
  p.created_at
FROM passwords p
JOIN users u ON p.user_id = u.user_id
  WHERE p.url IN ('https://www.mysql.com', 'https://github.com');

-- change URL
UPDATE passwords
SET url = 'https://example.com'
  WHERE url = 'http://example.com';

-- change password
UPDATE passwords
SET password = AES_ENCRYPT('UpdatedFakePassword666!', 'dbkey')
WHERE url = 'https://www.mysql.com';

-- remove a tuple based on url
DELETE FROM passwords
  WHERE url = 'http://testsite.com';

-- remove a tuple based on a password
DELETE FROM passwords
  WHERE password = AES_ENCRYPT('WhiteRabbit444!', 'dbkey');