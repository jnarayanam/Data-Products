
library(shiny)
ush <- read.csv("Data/outcomeofcaremeasures.csv")
ush[, 1] <- as.character(ush[, 1])
ush[, 3] <- as.numeric(ush[, 3])
ush[, 4] <- as.numeric(ush[, 4])
ush[, 5] <- as.numeric(ush[, 5])
source("rankhospital.R")

shinyServer(
  function(input, output) {
    output$inputstate <- renderPrint({input$state})
    output$inputDisease <- renderPrint({input$outcome})
    output$HospitalNames <- renderUI({
      Hospital <- subset(ush, State %in% input$state)$Hospital.Name
      Hospital <- as.character(Hospital)
      Hospital <- c(Hospital, "None")
      Hospital <- Hospital[order(Hospital)]
      selectInput("Hospital", "Hospital Name", Hospital, selected = "None")
    })
    output$nrows <- renderPrint({nrow(subset(ush, State %in% input$state))})
    output$inputHospital <- renderPrint({input$Hospital})
    output$Rank <- renderPrint({rankhospital(input$state, input$outcome, input$Hospital, ush)})
      }
  )
