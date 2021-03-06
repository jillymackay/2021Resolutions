library(tidyverse)
library(googlesheets)
library(nord)



url <- "https://docs.google.com/spreadsheets/d/1yMzVyDgMVbiI4kpKMzLoNv41wEgt0Irz7033r6FE2lA/edit?usp=sharing"
key <- extract_key_from_url(url)

dat <- gs_key(key) %>% 
  gs_read() %>% 
  janitor::clean_names() 
  



dat <- dat %>% 
  mutate_at(.vars = vars(c(x30_minutes, genre, specifics)), 
            parse_factor)



dat %>% 
  ggplot(aes(x = day, y = word_count, fill = x30_minutes, shape = genre)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(x = "Date", y = "Word Count") +
  scale_fill_nord(palette = "halifax_harbor")



# make a new palette with hue and luminence combined for genre and time?