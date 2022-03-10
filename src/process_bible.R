setwd("/Volumes/Drive 4/academic_external/question_bank/data/raw")

dat <- readLines('bible_cleaned.txt')

# Breaking on empty lines: 
# solution comes from r2evans at https://stackoverflow.com/questions/38958597/r-split-text-on-empty-line
nvec <- length(dat)
breaks <- which(! nzchar(dat))
nbreaks <- length(breaks)
if (breaks[nbreaks] < nvec) {
  breaks <- c(breaks, nvec + 1L)
  nbreaks <- nbreaks + 1L
}
if (nbreaks > 0L) {
  dat <- mapply(function(a,b) paste(dat[a:b], collapse = " "),
                   c(1L, 1L + breaks[-nbreaks]),
                   breaks - 1L)
}


dat <- tibble::tibble(verse = dat)

setwd("/Volumes/Drive 4/academic_external/question_bank/data/processed")
readr::write_csv(dat, "bible_processed.csv")


