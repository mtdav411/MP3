country <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country
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
data_country <- db %>%
  dbGetQuery(country)


#Filtering only movie produced in 1950
data_country_1950 <- data_country %>% filter(production_year == 1950) %>% summarise(number_of_non_US_western_1950 = length(id))
kable(data_country_1950)
#Filtering only movie produced in 2014
data_country_2014 <- data_country %>% filter(production_year == 2014) %>% summarise(number_of_non_US_western_2014 = length(id))
kable(data_country_2014)


dim(data_country_1950)

View(data_country_2014)
