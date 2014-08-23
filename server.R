library(shiny)
library(caret)
data(mtcars)
modFit <- train(mpg ~ hp + wt, data=mtcars, method="lm")


mpgFunc <- function(wt, hp) {
    predict(modFit, data.frame(hp=hp, wt=wt))
}

# Define server logic to calculate mpg based on weight and horsepower
shinyServer(function(input, output) {
    
    # Predicted mpg output
    outText <- reactive({
        paste("Predicted mpg:", round(mpgFunc(input$wt/1000, input$hp),2), "miles per gallon.")
    })
    
    # Summary of the weight and horsepower that were selected
    sumText <- reactive({
        paste("You selected a ", input$wt, "lb vehicle with a ", input$hp, "hp engine.")
    })
    
    # render text to the ui
    output$results <- renderText({outText()})
    output$summary <- renderText({sumText()})
})