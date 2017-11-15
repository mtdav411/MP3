MAX= 1912 and 2015
library(mdsr)
library(RMySQL)
db <- dbConnect_scidb(dbname = "imdb")

western <- "SELECT t.id, t.title, t.production_year AS Year,mi1.info AS Genres
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
WHERE Year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND info = 'Western'
AND Year
BETWEEN 1900 AND 2015;
"
data <- db %>%
  dbGetQuery(western)

View(data)
ggplot(data, aes(production_year)) +
  geom_histogram(aes(binwidth = range/10, fill = "#377EB8"))
