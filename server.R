#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # Data for this project was obtained from the NHTSA
  # National Highway Traffic Service Administration website
  # http://www-fars.nhtsa.dot.gov/Crashes/CrashesAlcohol.aspx
  
  fatalityInfo <- read.csv("AlcoholFatalities.csv",sep="\t")
  
  # Based on the inputs provided by the user using the slider bars and radio buttons
  # the necessary data is retrieved and filtered for the appropriate columns
  
  data <- eventReactive(input$goButton, { 
    inputStartTime <- input$TimeRange[1]
    inputEndTime <- input$TimeRange[2]
    inputAccidentType <- input$accident_type
    desiredRows <- filter(fatalityInfo, ((StartTime >=inputStartTime) & (EndTime <= inputEndTime)))
    desiredColumns <- select(desiredRows, StartTime, EndTime, starts_with(inputAccidentType))
    })
  
  # Data is then relayed to the UI and displayed as an HTML table
  output$table <- renderTable({
    data()
  })
})
