## For this assignment, I created a schema called "movies" and set it to the default schema. 
## I then created the following 3 tables within the movies schema.

DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS ratings;

CREATE TABLE person (
  person_ID integer PRIMARY KEY,
  first_name varchar(15) NOT Null,
  age integer not null,
  gender char(1) );

describe person;

INSERT INTO person (person_ID, first_name, age, gender) 
VALUES 
(1, 'Richard', 63, 'M'),
(2, 'Lucille', 52, 'F'),
(3, 'Stephanie', 28, 'F'),
(4, 'Dean', 23, 'M'),
(5, 'Michelle', 25, 'F');

  
CREATE TABLE movie (
  movie_ID integer PRIMARY KEY,
  movie_name varchar(60) NOT Null,
  genre varchar(20),
  release_date date);

describe movie;

#genre was taken from the first classification on IMDB
INSERT INTO movie (movie_ID, movie_name, genre, release_date) 
VALUES 
(1, 'Logan', 'Action', '2017-03-03'),
(2, 'Beauty and the Beast', 'Family', '2017-03-17'),
(3, 'Despicable Me 3', 'Animation', '2017-06-30'),
(4, 'Guardians of the Galaxy Vol. 2', 'Action', '2017-05-05'),
(5, 'Pirates of the Carribean: Dead Men Tell No Tales', 'Action', '2017-05-26'),
(6, 'Wonder Woman', 'Action', '2017-06-02');


CREATE TABLE ratings (
  person_ID integer,
  movie_ID integer,
  rating integer);

describe ratings;

INSERT INTO ratings (person_ID, movie_ID, rating)
VALUES
(1, 1, 4),
(1, 2, 5),
(1, 3, 3),
(1, 4, 3),
(1, 5, 4),
(1, 6, 4),
(2, 1, 4),
(2, 2, 5),
(2, 3, null),
(2, 4, null),
(2, 5, 3),
(2, 6, 4),
(3, 1, 4),
(3, 2, 4),
(3, 3, 4),
(3, 4, 5),
(3, 5, 5),
(3, 6, null),
(4, 1, null),
(4, 2, null),
(4, 3, null),
(4, 4, 4),
(4, 5, 4),
(4, 6, 5),
(5, 1, 4),
(5, 2, 4),
(5, 3, 3),
(5, 4, null),
(5, 5, 3),
(5, 6, null);

select * 
from person a 
inner join ratings b on a.person_ID = b.person_ID
inner join movie c on b.movie_ID = c.movie_ID ;

select movie_name, count(rating)
from ratings b 
inner join movie c on b.movie_ID = c.movie_ID
where rating is not null
group by movie_name
order by 2 desc limit 1;

select movie_name, avg(rating)
from ratings b 
inner join movie c on b.movie_ID = c.movie_ID
group by movie_name
order by 2 desc limit 1;

