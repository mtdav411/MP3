MAX= 1912 and 2015
library(mdsr)
library(RMySQL)
db <- dbConnect_scidb(dbname = "imdb")

western <- "SELECT t.id, t.title, t.production_year, mi1.info AS Genres
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi1.info = 'Western'
AND production_year
BETWEEN 1900 AND 2015;
"
data <- db %>%
  dbGetQuery(western)

View(data)

ggplot(data, aes(production_year)) +
       geom_histogram(binwidth = 1) +
  geom_rect(data = data,
            aes(xmin = begin, xmax = end, ymin = -Inf, ymax = +Inf),
            inherit.aes = FALSE, fill = "red", alpha = 0.2) +
  geom_line()

#ggplot(data, aes(production_year)) + geom_histogram()
#ggplot(data, aes(production_year), binwidth = range/10) +
  geom_histogram(aes(fill = "#377EB8"))
