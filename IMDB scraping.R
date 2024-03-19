#install.packages('rvest')
#install.packages('dplyr')

library(rvest)
library(dplyr)

link <- "https://www.imdb.com/list/ls526368735/"
page <- read_html(link)

name <- page %>% html_nodes(".lister-item-header a") %>% html_text()
genre <- page %>% html_nodes(".genre") %>% html_text()
rating <- page %>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% html_text()
synopsis <- page %>% html_nodes(".ipl-rating-widget+ p , .ratings-metascore+ p") %>% html_text()

movies <- data.frame(name, genre, rating, synopsis, stringsAsFactors = FALSE)
write.csv(movies, "movies.csv")

