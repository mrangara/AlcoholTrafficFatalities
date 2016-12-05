#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

# Define UI for application that shows traffic fatalities by time of day
shinyUI(
  fluidPage(
    
    # Application title
    titlePanel("Alcohol related traffic fatalities by time of day"),
    
    # Sidebar with a slider input and some radio buttons  
    sidebarLayout(
      sidebarPanel(
        # Slider input for specifying time range for accidents			    	
        sliderInput("TimeRange","Choose time of day (in 24 Hrs):",
                    min = 0, max = 24,value = c(0 ,3),step = 3,post = " Hrs"),
        helpText("Note: The time of day is specified in military time. For example", 
                 "0 represents","12:00 AM while while 15 represents 3:00PM.",
                 "Only 3 hour blocks can be chosen (sorry the data is only",
                 "in 3 hour time intervals)"),
        # Radio buttons to determine results are required for single vehicle, 
        # multiple vehicle or both type of accidents
        radioButtons("accident_type", "Type of Accident", 
                     c("Single Vehicle" = "SV","Multiple Vehicle" = "MV","Single & Multiple Vehicle"="Total"), 
                     selected = NULL, inline = FALSE,
                     width = NULL),
        br(),
        
        # The action button ensures that results are displayed only after the
        # user clicks on the Search button
        actionButton("goButton","Search",icon=icon("search-plus")),
        helpText("Click on search to view results")
      ),
      # Show the results that meet the criteria specified in the slider bars 
      # and radio button. Results are presented as an HTML table
      mainPanel(
        h4('Results based on your search criteria'),
        tableOutput('table')
      )	
    )
    
  ))
