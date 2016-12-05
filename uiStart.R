
library(shiny)

# Define UI for application that shows traffic fatalities by time of day
shinyUI(
	fluidPage(
  
	# Application title
  	titlePanel("Alcohol related traffic fatalities by time of day"),
  
	# Sidebar with a slider input and a text box  
  	sidebarLayout(
    	sidebarPanel(
			# Slider input for specifying time range for accidents			    	
       		sliderInput("TimeRange","Time of day (in 24 Hrs):",
                   		min = 0, max = 24,value = 2,step = 3,post = "Hrs"),
            # Choice of inputs for 
       		selectInput("input_type", "Input type",
                  c("slider", "text", "numeric", "checkbox",
                  "checkboxGroup", "radioButtons", "selectInput",
                  "selectInput (multi)", "date", "daterange"))
    	),
    	# Show a plot of the generated distribution
		mainPanel(
  			textOutput(dynamic_value)
		)	
  )

))