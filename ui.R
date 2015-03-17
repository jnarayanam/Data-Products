states <- c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", 
            "DC", "DE", "FL", "GA", "GU", "HI", "IA", 
            "ID", "IL", "IN", "KS", "KY", "LA","MA", 
            "MD", "ME", "MI", "MN", "MO", "MS", "MT", 
            "NC", "ND", "NE", "NH", "NJ", "NM", "NV", 
            "NY", "OH", "OK", "OR", "PA", "PR", "RI", 
            "SC", "SD", "TN", "TX", "UT", "VA", "VI", 
            "VT", "WA", "WI", "WV", "WY", "None")
library(shiny)
shinyUI(fluidPage
        # Application Title
        (titlePanel("Hospital Rank"),
         sidebarLayout(
           sidebarPanel(
           selectInput(inputId = "state", 
                       label = "state", 
                       choices = states, selected = "None"),
           helpText("Choose the State Code"),
           selectInput(inputId = "outcome", label = "Disease Name",
                       choices = c("heart attack", "heart failure", "pneumonia", "None"),
                       selected = "None"),
           helpText("Select the Disease Name"),
           submitButton("Submit"),
           conditionalPanel(
             condition = "submitButton$Submit == TRUE",
             uiOutput("HospitalNames", inline = FALSE)),
           helpText("Select the Hospital Name"),
           submitButton("Go")
         ),
           
         mainPanel(
           h4("Selected State"),
           verbatimTextOutput("inputstate"),
           h4("Selected Disease"),
           verbatimTextOutput("inputDisease"),
           h4("Number of Hospitals in the State"),
           verbatimTextOutput("nrows"),
           h4("Selected Hospital"),
           verbatimTextOutput("inputHospital"),
           h3("Hospital Rank"),
           verbatimTextOutput("Rank"),
           p("Rank calculated based on mortality rate")
           
           )
          )
        )
)
