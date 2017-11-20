
western3 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 8
AND mi1.info = 'Western'
AND mi2.info <> 'USA';
"
data_country_2015<- db %>%
  dbGetQuery(western3)

dim(data_country_2015)
data_country_2015 <- data %>% filter()


western4 <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 8
AND mi1.info = 'Western'
AND mi2.info <> 'USA'
AND production_year = 1950;
"
data_country_1950<- db %>%
  dbGetQuery(western4)

dim(data_country_1950)