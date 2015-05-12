## This shiny app intends to help user train linear model for mtcars dataset. 
## User can select non-zero number of variables from the left-side checkbox and 
## model training result is printed in the right-side panel.
## In addition, this app records the best model with maximum R Squared values
## automatically in order to help user memorize the best model so far

library(shiny)

# Define UI for mtcars model training application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Model training for mtcars"),
  
  p("Documentation could be found ",
    tags$a(href="http://tiagolicanton.github.io/DataProductShinyAppSlidify/#1", "here")),
  
  # Sidebar with controls to provide a way to select different combination
  # of variables from mtcars
  sidebarLayout(
    sidebarPanel(
      h4("Select variables from the checkbox to train a linear model for mpg~variables"),
      checkboxGroupInput("cb_variable", "Variable:",
                         c("Cylinders" = "cyl",
                           "Displacement" = "disp",
                           "Gross horsepower" = "hp",
                           "Rear axle ratio" = "drat",
                           "Weight" = "wt",
                           "1/4 mile time" = "qsec",
                           "Transmission" = "am",
                           "Gears" = "gear",
                           "Carburetors" = "carb"),selected=c())
    ),
    
   

    
    # Show the trained model based on selected variables
    mainPanel(
      h4("Max R Squared so far"),
      verbatimTextOutput("max_percentage_view"),
      h4("Corresponding variables"),
      verbatimTextOutput("max_model"),
      h4("Summary of current model"),
      verbatimTextOutput("view")
    )
  )
))