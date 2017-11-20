
western3 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Rating
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info_idx AS mi2 ON mi2.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 101
AND mi1.info = 'Western'
AND production_year = 2015
ORDER BY mi2.info desc
LIMIT 0,10;
"
data_popularity_2014 <- db %>%
  dbGetQuery(western3)

western4 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Rating
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info_idx AS mi2 ON mi2.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 101
AND mi1.info = 'Western'
AND production_year = 1950
ORDER BY mi2.info desc
LIMIT 0,10;
"
data_popularity_1950 <- db %>%
  dbGetQuery(western4)

View(data_popularity_2014)
View(data_popularity_1950)
