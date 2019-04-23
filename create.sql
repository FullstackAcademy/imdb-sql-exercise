CREATE TABLE movies (
  id INTEGER,
  name TEXT,
  year INTEGER,
  rank REAL,
  PRIMARY KEY (id)
);

CREATE TABLE actors (
  id INTEGER,
  first_name TEXT,
  last_name TEXT,
  gender TEXT
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT
);


.schema actors

-- Birthyear
SELECT * FROM movies WHERE year = YEAR;

-- 1982
SELECT COUNT(*) FROM movies WHERE year = 1982;

-- stacktors
SELECT * FROM actors WHERE last_name LIKE "%stack%";

-- Fame Name Game

SELECT first_name, COUNT(*) AS occurrences FROM actors GROUP BY first_name ORDER BY COUNT(*) DESC LIMIT 10;

SELECT last_name, COUNT(*) AS occurrences FROM actors GROUP BY last_name ORDER BY COUNT(*) DESC LIMIT 10;

SELECT first_name || ' ' || last_name AS full_name, COUNT(*) AS occurrences FROM actors GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 10;

-- Prolific

SELECT actor_id, first_name, last_name, COUNT(*) AS total_roles FROM roles INNER JOIN actors ON roles.actor_id = actors.id GROUP BY actor_id ORDER BY total_roles DESC LIMIT 10;

-- Bottom of the Barrel

SELECT movies_genres.genre, COUNT(*) as number_of_genres FROM movies INNER JOIN movies_genres ON movies.id = movies_genres.movie_id GROUP BY movies_genres.genre ORDER BY number_of_genres ASC;

-- Braveheart

SELECT
  actors.first_name, actors.last_name
FROM
  movies
INNER JOIN
  actors, roles
    ON actors.id = roles.actor_id
    AND movies.id = roles.movie_id
WHERE
  movies.name LIKE "Braveheart"
  AND movies.year = 1995;
ORDER BY
  actors.last_name
ASC
