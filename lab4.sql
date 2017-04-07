--1.1
INSERT INTO subscriber
VALUES (5, "vasya", "Eshkinina, 10");
--1.2
INSERT INTO subscriber ( name_subscriber, address )
VALUES ("oleg", "Chavayna, 20");
--1.3
INSERT INTO subscriber ( address )
SELECT (address)
FROM publishing_house;
--2.1
DELETE *
FROM publication;
--2.2
DELETE *
FROM subscriber
WHERE id_user ='3';
--2.3
TRUNCATE TABLE subscriber;
--3.1
UPDATE subscriber SET name_subscriber = "oleg";
--3.2
UPDATE subscriber SET address = "chavayna"
WHERE address = "eshkinina";
--3.3
UPDATE publication SET name_publication = "ogorod", genre = "story"
WHERE id_publication = 6;
--4.1
SELECT name_subscriber, address
FROM subscriber;
--4.2
SELECT *
FROM publication;
--4.3
SELECT *
FROM subscriber
WHERE name_subscriber = "oleg";
