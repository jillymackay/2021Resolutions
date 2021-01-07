library(tidyverse)
library(googlesheets)



url <- "https://docs.google.com/spreadsheets/d/1yMzVyDgMVbiI4kpKMzLoNv41wEgt0Irz7033r6FE2lA/edit?usp=sharing"
key <- extract_key_from_url(url)

dat <- gs_key(key) %>% 
  gs_read() %>% 
  janitor::clean_names() 
  



dat <- dat %>% 
  mutate_at(.vars = vars(c(x30_minutes, genre, specifics)), 
            parse_factor)



dat %>% 
  ggplot(aes(x = day, y = word_count, shape = x30_minutes, colour = genre)) +
  geom_point() +
  theme_classic()
