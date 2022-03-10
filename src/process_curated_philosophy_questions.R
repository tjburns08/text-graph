setwd("/Volumes/Drive\ 4/academic_external/question_bank/data/processed")

library(magrittr)
dat <- readr::read_csv("curated_philosophical_questions.csv") %>% na.omit()
dat$Question <- gsub(".*\\. ", "", dat$Question)
dat <- dat[!("questions about" %in% dat$Question),]

readr::write_csv(dat, "curated_philosophical_questions.csv")