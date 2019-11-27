library(shiny)

ui <- fluidPage(
  
  titlePanel("My Project!!!-Mengxiao"),

  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId = "bins",
                  label = "Number of strains:",
                  min = 1,
                  max = 50,
                  value = 30),
      
      selectInput(inputId = "selects",
                  label = "Countries",
                  choices = list("US" = 1, "China" = 2,
                                 "Mexico" = 3, "Brazil" = 4), selected = 1),
      
      textInput("text", h3("Strains"), 
                value = "Enter text...")  
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}
shinyApp(ui = ui, server = server)