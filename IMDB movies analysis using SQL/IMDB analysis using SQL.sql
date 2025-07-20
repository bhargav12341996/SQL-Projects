drop table if exists imdb_top_movies;
create table if not exists imdb_top_movies
(
	Poster_Link		varchar(4000),		
	Series_Title	varchar(500),
	Released_Year	varchar(20),
	Certificate		varchar(10),
	Runtime			varchar(20),
	Genre			varchar(100),
	IMDB_Rating		decimal,
	Overview		varchar(4000),
	Meta_score		int,
	Director		varchar(200),
	Star1			varchar(200),
	Star2			varchar(200),
	Star3			varchar(200),
	Star4			varchar(200),
	No_of_Votes		int,
	Gross			money
);


--- SQL Queries:

Question 1: Fetch all the columns and rows from the table:

SELECT * 
FROM imdb_top_movies;

----------------------------------------------------------------------

Question 2: Fetch name & release year for all the movies:

SELECT series_title, released_year 
FROM imdb_top_movies;

----------------------------------------------------------------------

Question 3: Fetch the name, release year and imdb rating of movies which are UA certified.

SELECT series_title, released_year, imdb_rating
FROM imdb_top_movies 
WHERE certificate = 'UA';

----------------------------------------------------------------------

Question 4: Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.

SELECT series_title, genre, imdb_rating
FROM imdb_top_movies
WHERE certificate = 'UA' AND imdb_rating > 8;

----------------------------------------------------------------------

Question 5:Find out how many movies are of Drama genre.

SELECT COUNT(*)
FROM imdb_top_movies
WHERE UPPER(genre) LIKE '%DRAMA%';

----------------------------------------------------------------------

6) How many movies are directed by any one of them from below:
	"Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".

SELECT COUNT(*)
FROM imdb_top_movies 
WHERE director IN ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan', 'Rajkumar Hirani')

----------------------------------------------------------------------

7) What is the highest imdb rating given for a movie so far?

SELECT MAX(imdb_rating) AS max_rating
FROM imdb_top_movies  movies

----------------------------------------------------------------------

8) Display both highest rating and lowest rating, but in row format and not in columnar format.


SELECT MAX(imdb_rating) AS movie_rating, 'Highest rating' AS high_low
FROM imdb_top_movies
UNION  
SELECT MIN(imdb_rating) , 'Lowest rating' AS high_low
FROM imdb_top_movies;

----------------------------------------------------------------------

9) Find out total gross revenue collected by movies staring "Aamir Khan".

METHOD1:

select sum(gross)
from imdb_top_movies
where star1 = 'Aamir Khan'
or star2 = 'Aamir Khan'
or star3 = 'Aamir Khan'
or star4 = 'Aamir Khan';

METHOD2:

select sum(gross)
from imdb_top_movies
where 'Aamir Khan' IN (star1, star2, star3, star4);

----------------------------------------------------------------------

10) Display the movie names and watch time (in both mins and hours) which have over 9 imdb rating.

SELECT series_title
, runtime AS runtime_mins
, round(replace(runtime, ' min', '')::decimal /60,2) AS runtime_hrs                               --- We are casting varchar to decimal and rounding it to 2 digits.
FROM imdb_top_movies
WHERE imdb_rating > 9;

----------------------------------------------------------------------

11) What are the different certificates given to movies?

select distinct certificate
from imdb_top_movies
order by certificate;

----------------------------------------------------------------------

12) Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. Movies shorter than 1 hour should be termed as short film. 
	Movies longer than 2 hrs should be termed as longer movies, all others can be termed as Good watch time.

SELECT series_title as movie_name,
	   (case when round(replace(runtime, ' min', '')::decimal /60,2) < 1 then 'Short film'
	   when round(replace(runtime, ' min', '')::decimal /60,2) > 2 then 'Longer Movies'
       else 'Good watch time'
       end) AS category
FROM imdb_top_movies
WHERE released_year <> 'PG'
AND EXTRACT(year from current_date ) - released_year::int <= 10
AND (UPPER(genre) LIKE '%DRAMA%' 
    OR LOWER(genre) LIKE '%comedy%')
ORDER BY category;

------------------------------------------------------------------------













