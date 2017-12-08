library(tidyverse)
library(scales)
library(ggplot2)
library(splitstackshape)
library(mdsr)
library(RMySQL)
db <- dbConnect_scidb(dbname = "imdb")


toptengross <- "SELECT t.id, t.title, t.production_year,mi1.info AS Genre, mi2.info AS Gross
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND mi1.info_type_id = 3
AND mi2.info_type_id = 107
AND mi1.info = 'Western';
"
data_toptengross <- db %>%
  dbGetQuery(toptengross)


data_toptengross <- cSplit(data_toptengross, "Gross", "(")
View(data_toptengross)

data_toptengross_final <- data_toptengross %>%  mutate (Gross= parse_number(Gross_1)) %>% group_by(id, title, production_year) %>% summarise(Gross=max(Gross)) %>% arrange(desc(Gross)) %>% filter(between(row_number(), 1, 10))

data_toptengross_final_1 <- head(data_toptengross_final,10)

kable(data_toptengross_final_1)

