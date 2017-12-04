#Calculating the mean budget for 1950 and 2014
budget <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres, mi2.info AS Country, mi3.info AS Budget
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
AND mi2.info = 'USA';
"
data_budget <- db %>%
  dbGetQuery(budget)
data_budget_1950 <- data_budget %>% filter(production_year == 1950)
data_budget_2014 <- data_budget %>% filter(production_year == 2014)


# We then downloaded the data and uploaded it again so we could extract the numerical values from the "$" and the "," on the budget column

Average_budget_2014 = 
Average_budget_1950 = 
