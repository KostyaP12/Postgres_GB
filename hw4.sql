//
SELECT 
id, 
url,
(SELECT first_name FROM users WHERE users.id = video.owner_id) AS first_name,
(SELECT last_name FROM users WHERE users.id = video.owner_id) AS last_name,
(SELECT(SELECT url FROM photo WHERE photo.id = users.main_photo_id) FROM users WHERE users.id = video.owner_id) AS main_photo_url,
size 
FROM video
ORDER BY size DESC LIMIT 10;


//
CREATE TEMPORARY TABLE hw_video(id INT, url VARCHAR(250), size INT, owner_id INT);

INSERT INTO hw_video 
SELECT id,
url,
size,
owner_id
FROM video
ORDER BY size DESC LIMIT 10;

SELECT 
hw_video.id,
first_name,
last_name,
photo.url AS main_photo_url,
hw_video.url AS video_url,
hw_video.size
FROM users
JOIN hw_video
ON hw_video.owner_id = users.id
JOIN photo
ON photo.id = users.main_photo_id
ORDER BY size DESC;

//
WITH hw_video AS (SELECT id, url, size, owner_id FROM video ORDER BY size DESC LIMIT 10)
SELECT
hw_video.id,
first_name,
last_name,
photo.url AS main_photo_url,
hw_video.url AS video_url,
hw_video.size
FROM users
JOIN hw_video
ON hw_video.owner_id = users.id
JOIN photo
ON photo.id = users.main_photo_id
ORDER BY size DESC;

//
SELECT 
video.id,
first_name,
last_name,
photo.url AS main_photo_url,
video.url AS video_url,
video.size
FROM users
JOIN video
ON video.owner_id = users.id
JOIN photo
ON photo.id = users.main_photo_id
ORDER BY size DESC
LIMIT 10;

