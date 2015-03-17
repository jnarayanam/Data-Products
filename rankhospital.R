library(dplyr)
rankhospital <- function (state, outcome, Hospital, ush) {
  if ((state %in% ush[["State"]])) {
    sdata <- subset (ush, ush$State == state)
    if (outcome == "heart attack") {
      numdata <- sdata[, c(2, 11)]
    }
    else if (outcome == "heart failure") {
      numdata <- sdata[, c(2, 17)]
    }
    else if (outcome == "pneumonia")  {
      numdata <- sdata[, c(2, 23)]
    }
    else {
      stop ("Please select the Disease")
    }
    numdata[, 2] <- as.numeric (numdata[, 2])  
    numdata <- numdata[numdata[, 2] != "Not Available", ]
    numdata <- numdata[order(numdata[, 2]), ]
    numdata[, 1] <- as.character(numdata[, 1])
    numdata <- numdata %>% mutate(Rank = seq(1:nrow(numdata)))
    Rank <- subset(numdata, Hospital.Name %in% Hospital)[[3]]
    print(Rank)
  }
  else {
    print ("Please select the state")
  }
  
}
