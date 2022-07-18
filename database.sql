CREATE TABLE Figure_Skater (
    world_rank INT PRIMARY KEY,
    first_name VARCHAR (40),
    last_name VARCHAR (40),
    nation VARCHAR (10),
    birth_date DATE,
    event_id INT
    );

CREATE TABLE Judge (
    judge_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (40),
    last_name VARCHAR (40),
    nation VARCHAR (10),
    judge_function VARCHAR (40),
    event_id INT
);

CREATE TABLE Grand_Prix_Series (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR (20),
    city VARCHAR (20)
);

ALTER TABLE Grand_Prix_Series
ADD COLUMN event_name VARCHAR (40);

ALTER TABLE Grand_Prix_Series
MODIFY COLUMN event_name VARCHAR(40) AFTER event_id;

ALTER TABLE Figure_Skater
ADD FOREIGN KEY(event_id)
REFERENCES Grand_Prix_Series(event_id);

ALTER TABLE Judge
ADD FOREIGN KEY(event_id)
REFERENCES Grand_Prix_Series(event_id);

-- Grand_Prix_Series

INSERT INTO Grand_Prix_Series VALUES (1, "Skate America", "USA", "Las Vegas");
INSERT INTO Grand_Prix_Series VALUES (2,"Skate Canada", "Canada", "Vancouver");
INSERT INTO Grand_Prix_Series VALUES (3, "Gran Premio D'Italia", "Italy", "Torino");
INSERT INTO Grand_Prix_Series VALUES (4, "NHK Trophy", "Japan",	"Tokyo");
INSERT INTO Grand_Prix_Series VALUES (5, "Internationaux de France", "France", "Grenoble");
INSERT INTO Grand_Prix_Series VALUES (6, "Rostelecom Cup", "Russia", "Sochi");

-- Figure_Skater

INSERT INTO Figure_Skater VALUES (7,'Alexandra','Trusova', 'RUS', '2004-06-23', 1);
INSERT INTO Figure_Skater VALUES (89, 'Daria', 'Usacheva', 'RUS', '2006-05-22', 1);
INSERT INTO Figure_Skater VALUES (5, 'Young', 'You', 'KOR', '2004-05-27', 1);
INSERT INTO Figure_Skater VALUES (4, 'Kamila',  'Valieva', 'RUS', '2006-04-26', 2);
INSERT INTO Figure_Skater VALUES (24, 'Elizaveta', 'Tuktamysheva', 'RUS', '1996-12-17', 2);
INSERT INTO Figure_Skater VALUES (27, 'Alena', 'Kostornaya', 'RUS', '2003-08-24', 2);
INSERT INTO Figure_Skater VALUES (1, 'Anna', 'Shcherbakova', 'RUS', '2004-03-28', 3);
INSERT INTO Figure_Skater VALUES (13, 'Mariia', 'Khromykh', 'RUS', '2006-05-25', 3);
INSERT INTO Figure_Skater VALUES (6, 'Loena', 'Hendrickx', 'BEL', '1999-11-05', 3);
INSERT INTO Figure_Skater VALUES (3, 'Kaori', 'Sakamoto', 'JPN', '2000-04-09', 4);
INSERT INTO Figure_Skater VALUES (38, 'Mana', 'Kawabe', 'JPN', '2004-10-31', 4);
INSERT INTO Figure_Skater VALUES (2, 'Alysa', 'Liu', 'USA', '2005-08-08', 4);
INSERT INTO Figure_Skater VALUES (9, 'Wakaba', 'Higuchi', 'JPN', '2001-01-02', 5);
INSERT INTO Figure_Skater VALUES (49, 'Kseniia', 'Sinitsyna', 'RUS', '2004-08-05', 5);
INSERT INTO Figure_Skater VALUES (14, 'Karen', 'Chen', 'USA', '1999-08-16', 5);
INSERT INTO Figure_Skater VALUES (10, 'Mariah', 'Bell', 'USA', '1996-04-18', 6);
INSERT INTO Figure_Skater VALUES (26, 'Madeline', 'Schizas', 'CAN', '2003-02-14', 6);
INSERT INTO Figure_Skater VALUES (19, 'Viktoriia', 'Safonova', 'BLR', '2003-05-08', 6);

-- Judge

INSERT INTO Judge VALUES (1,'Laimute', 'Krauziene', 'ISU', 'Referee', 1);
INSERT INTO Judge VALUES (2, 'Erica', 'Topolski', 'CAN', 'Judge', 1);
INSERT INTO Judge VALUES (3, 'Beth', 'Crane', 'ISU', 'Technical Controller', 2);
INSERT INTO Judge VALUES (4, 'Ritsuko', 'Horiuchi', 'JPN', 'Judge', 2);
INSERT INTO Judge VALUES (5, 'Zoltan', 'Janosi', 'ISU', 'Data Operator', 3);
INSERT INTO Judge VALUES (6, 'Chihee', 'Rhee', 'KOR', 'Judge', 3);
INSERT INTO Judge VALUES (7, 'Steven', 'Hsu', 'ISU', 'Replay Operator', 4);
INSERT INTO Judge VALUES (8, 'Pernilla', 'Bohling', 'FIN', 'Judge', 4);
INSERT INTO Judge VALUES (9, 'Linda', 'Leaver', 'USA', 'Judge', 5);
INSERT INTO Judge VALUES (10, 'Emilie', 'Billow', 'ISU', 'Technical Controller', 5);
INSERT INTO Judge VALUES (11, 'Margaret', 'Worsfold', 'ISU', 'Referee', '6');
INSERT INTO Judge VALUES (12, 'Massimo', 'Orlandini', 'ITA', 'Judge', 6);

-- BASIC QUERIES

-- Find all figure skaters

SELECT *
FROM Figure_Skater;

-- Find all judges ordered by last name

SELECT *
FROM Judge
ORDER BY last_name;

-- Find the first 5 figure skaters in the table

SELECT *
FROM Figure_Skater
LIMIT 5;

-- Find the first and last names of all judges

SELECT first_name, last_name
FROM Judge;

-- Find the forename and surnames of all figure skaters

SELECT first_name AS forename, last_name AS surname
FROM Figure_Skater;

-- Find all judges at Rostelecom Cup. Assume you know this event's ID

SELECT *
FROM Judge
WHERE event_id = 6;

-- Find all figure skaters' names who were born after 2000

SELECT first_name, last_name
FROM Figure_Skater
WHERE birth_date >= '2001-01-01';

-- Find all figure skaters who were born between 1995 and 2000

SELECT *
FROM Figure_Skater
WHERE birth_date BETWEEN '1995-01-01' AND '2000-01-01';

-- Find all judges who are from Canada or Korea

SELECT *
FROM Judge
WHERE nation = "CAN" OR nation = "KOR";

-- Find all figure skaters named Anna, Kaori or Michelle

SELECT *
FROM Figure_Skater
WHERE first_name IN ('Anna', 'Kaori', 'Michelle');

-- FUNCTIONS

-- Find the number of judges

SELECT COUNT(judge_id)
FROM Judge;

-- Find out how many Russian figure skaters there are

SELECT COUNT(world_rank), world_rank
FROM Figure_Skater
WHERE nation = "RUS";

-- WILDCARDS

-- Find any figure skater born in 2004

SELECT *
FROM Figure_Skater
WHERE birth_date LIKE '%2004%';

-- Find any figure skater born in June

SELECT *
FROM Figure_Skater
WHERE birth_date LIKE '_____06%';

-- UNION

-- Find a list of figure skaters' and judges' last names

SELECT Figure_Skater.last_name AS Last_Names_Of_Skaters_And_Judges
FROM Figure_Skater
UNION
SELECT Judge.last_name
FROM Judge;

-- NESTED QUERIES

-- Find all figure skaters who competed at NHK Trophy

SELECT Figure_Skater.first_name, Figure_Skater.last_name
FROM Figure_Skater
WHERE Figure_Skater.event_id = (SELECT Grand_Prix_Series.event_id
                  FROM Grand_Prix_Series
                  WHERE event_name = "NHK Trophy");