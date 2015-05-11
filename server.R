library(shiny)
data(mtcars)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # define global variables to store the best model
  best<<-0
  bestModel<<-""
  
  # logic to update the R squared of the best model 
  output$max_percentage_view<-renderPrint({
    if (best<summary(model())$r.squared){
      best <<- summary(model())$r.squared
      bestModel<<-input$cb_variable
    }
    best
  })
  
  # logic to update the best model
  output$max_model<-renderPrint({
    model()
    bestModel
    })
  
  # logic to print out the current model summary when the checkBox is clicked
  output$view <- renderPrint({
    summary(model())
  })
  
  # logic to calculate the linear model based on selected variables
  model <- reactive({

    new_formula <- reformulate(termlabels=input$cb_variable,response='mpg')
    lm(new_formula, data=mtcars)
    
  })
})