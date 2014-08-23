library(shiny)

# Define the user interface for mpg application
shinyUI(pageWithSidebar(
    
    # Set title of app
    headerPanel("Miles Per Gallon Calculator"),
    
    # Create input section in sidebar
    sidebarPanel(
        h5("Select the weight and horsepower of the vehicle"),
        # Add sliders to sidebar for setting weight and horsepower
        sliderInput("wt", "Vehicle Weight (lbs)", value=2000, min=1000, max=6000, step=100),
        sliderInput("hp", "Engine Horsepower", value=180, min=40, max=400, step=20)
        ),
    
    # Create output section in main panel
    mainPanel(
        h4("Using the mtcars dataset included with R (from Motor Trend 1973/74 data) we can predict how many miles per gallon (mpg) a car should get for a given weight and horsepower."),
        h4("Select a weight and horsepower using the sliders to see predicted mpg."),
        h4(textOutput("summary")),
        h4(textOutput("results"))
        )
))