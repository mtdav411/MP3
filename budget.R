library(tidyverse)
library(scales)
library(ggplot2)
library(splitstackshape)
library(mdsr)
library(RMySQL)
library(knitr)
db <- dbConnect_scidb(dbname = "imdb")


budget <- "SELECT t.id, t.title, t.production_year, mi2.info AS Gross, mi3.info AS Budget
FROM title t
JOIN movie_info AS mi1 ON mi1.movie_id = t.id
JOIN movie_info AS mi2 ON mi2.movie_id = t.id
JOIN movie_info AS mi3 ON mi3.movie_id = t.id
WHERE production_year IS NOT NULL
AND t.kind_id = 1
AND t.title IN ('Cowboys & Aliens', 'Rango', 'Django Unchained', 'The Revenant', 'High Noon', 'Shane', 'The Researchers', 'The Wild Bunch', 'Dances with Wolves' )
AND mi1.info_type_id = 3
AND mi2.info_type_id = 107
AND mi3.info_type_id = 105;
"
data_budget <- db %>%
  dbGetQuery(budget)


data_budget <- cSplit(data_budget, "Gross", "(")




data_budget_final <- data_budget %>%  mutate (Gross= parse_number(Gross_1), Budget= parse_number(Budget)) %>% group_by(id, title, production_year, Budget) %>% summarise(Gross=max(Gross)) %>% mutate (Profits = (Gross-Budget)) %>%
rename("Title" = title, "Year" = production_year)

kable(data_budget_final)

