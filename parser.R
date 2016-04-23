library(dplyr)
library(lubridate)
library(tm)
library(tidyr)
library(jsonlite)

requests <- read.csv("data/requests.csv", stringsAsFactors=FALSE)
requests$date_submitted <- ymd(requests$date_submitted)
requests$date_done <- ymd(requests$date_done)

#table(requests$status)

requests$interval <- interval(requests$date_submitted, requests$date_done)
requests$days <- requests$interval / ddays(1)

# Getting rid of negative days (Because of requests filed in December)

for (i in 1:nrow(requests)) {
  if ((!is.na(requests$days[i])) && (requests$days[i] < 0)) {
    temp <- requests$date_done[i]
    requests$date_done[i] <- requests$date_submitted[i] 
    requests$date_submitted[i] <- temp
  }
  
}

requests$interval <- interval(requests$date_submitted, requests$date_done)
requests$days <- requests$interval / ddays(1)


# text

# requests$text <- paste(requests$title, requests$description)

# review_source <- VectorSource(requests$text)

# corpus <- Corpus(review_source)

# corpus <- tm_map(corpus, content_transformer(tolower))


# corpus <- tm_map(corpus, removePunctuation)

# corpus <- tm_map(corpus, stripWhitespace)

# corpus <- tm_map(corpus, removeWords, stopwords("english"))

# dtm <- DocumentTermMatrix(corpus)

# dtm2 <- as.matrix(dtm)

# frequency <- colSums(dtm2)

# frequency <- sort(frequency, decreasing=TRUE)

# head(frequency)


departments <- requests %>%
  group_by(agency_name, status) %>%
  summarise(requests=n()) %>%
  spread(status, requests)

departments_avgs <- requests %>%
  group_by(agency_name, status) %>%
  summarise(avg_time=mean(days, na.rm=TRUE)) %>%
  spread(status, avg_time)

colnames(departments_avgs) <- c("agency_name", "abandoned_avg", "ack_avg", "appealing_avg", "done_avg", "fix_avg", "no_docs_avg", "partial_avg", "payment_avg", "processed_avg", "rejected_avg", "submitted_avg")


departments[is.na(departments)] <- 0

departments$total <- departments$abandoned+ departments$ack + 
                         departments$appealing+ departments$done + 
                         departments$fix + departments$no_docs +
                         departments$partial + departments$payment+ 
                         departments$processed+ departments$rejected+ 
                         departments$submitted

departments$abandoned_per <- round(departments$abandoned/departments$total*100,2)
departments$ack_per <- round(departments$ack/departments$total*100,2)
departments$appealing_per <- round(departments$appealing/departments$total*100,2)
departments$done_per <- round(departments$done/departments$total*100,2)
departments$fix_per <- round(departments$fix/departments$total*100,2)
departments$no_docs_per <- round(departments$no_docs/departments$total*100,2)
departments$partial_per <- round(departments$partial/departments$total*100,2)
departments$payment_per <- round(departments$payment/departments$total*100,2)
departments$processed_per <- round(departments$processed/departments$total*100,2)
departments$rejected_per <- round(departments$rejected/departments$total*100,2)
departments$submitted_per <- round(departments$submitted/departments$total*100,2)

departments <- left_join(departments, departments_avgs)
departments[ departments == "NaN" ] = NA

dept_json <- toJSON(departments)
cat(dept_json)

write(dept_json, "agencies.json")
