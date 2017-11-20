
western2 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country, mi3.info AS Budget
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
AND production_year
BETWEEN 1900 AND 2015;
"
data_country_budget <- db %>%
  dbGetQuery(western2)

View(data_country_budget)

