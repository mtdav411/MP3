library(tidyverse)
library(mdsr)
library(RMySQL)
db <- dbConnect_scidb(dbname = "imdb")

genre <- "SELECT t.id, t.title, t.production_year AS Year, mi1.info AS Genres
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
WHERE t.production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND t.production_year
AND 1949 AND 1951
AND mi2.info = 'USA';
"
genre1 <- db %>%
  dbGetQuery(genre)

View(genre1)

genre0 <- genre1 %>% group_by(Genres) %>% summarise(sum=n()) %>% arrange(desc(sum))
View(genre0)
