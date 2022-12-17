####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/

library(shiny)
library(ggplot2)
gret_sent <- read.csv("/Users/sophiagiustino/Documents/Fall2022/Stat433/Project/shiny/lily_app/gret_sent.csv")

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("How Emotionally Laden Words Affect Retweet Count"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      selectInput(inputId = "VarX",
                  label = "Select X-Axis: Dictionary Ratio",
                  choices = list("bingRatio", "nrcRatio", "loughRatio")),
      selectInput(inputId = "VarY",
                  label = "Select Y-Axis",
                  choices = list("retweet_count"))
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "scatter")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  #gret_sent = read.csv("/Users/lilyfranks/Desktop/SCHOOL/STAT 433/FINAL PROJECT/data/gret_sent.csv")

  output$scatter <- renderPlot({
    
    #gret_sent <- read.csv("gret_sent.csv")
    
    graph <- gret_sent[ ,c(input$VarX, input$VarY)]
    
    #plot(graph[,1], log(graph[,2]),
         #xlab = colnames(graph)[1],
         #ylab = colnames(graph)[2],
         #main = paste("Scatter and Fitted Line Plot of", input$VarX, "vs Log of", input$VarY)
         #)
    #abline(lm(log(graph[,2]) ~ graph[,1], data=graph), col = "red")
    ggplot(graph, aes(graph[,1], log(graph[,2]))) +
      geom_point(alpha = 0.1) +
      geom_smooth(method = "lm") +
      xlab(paste(input$VarX, "Measure (Dictionary Words: Total Tweet Words)"))+
      ylab("Retweet Count (Log)") +
      ggtitle(paste("Scatter and Fitted Line Plot of", input$VarX, "vs Retweet Count (Log)"))
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
