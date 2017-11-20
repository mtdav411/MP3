
western5 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country, mi3.info AS Budget
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
JOIN movie_info AS mi3 ON mi3.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 8
AND mi3.info_type_id = 105
AND mi1.info = 'Western'
AND mi2.info = 'USA'
AND production_year = 2015;
"
data_budget_2015 <- db %>%
  dbGetQuery(western5)

western6 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country, mi3.info AS Budget
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
JOIN movie_info AS mi3 ON mi3.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 8
AND mi3.info_type_id = 105
AND mi1.info = 'Western'
AND mi2.info = 'USA'
AND production_year = 1950;
"

genre <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi1.info LIKE 'Western'
AND production_year = 2015;
"
data_genre_2015<- db %>%
  dbGetQuery(genre)

View(data_genre_2015)

genre1 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND production_year = 1950;
"
data_genre_1950<- db %>%
  dbGetQuery(genre1)

View(data_genre_1950) 
data_budget_1950 <- db %>%
  dbGetQuery(western6)
options(scipen = 999)
View(data_budget_2015)
data_budget_2015$Budget <- as.numeric (gsub('[$,]','', data_budget_2015$Budget))
summarise(data_budget_2015, sum=mean(Budget, na.rm) )