#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("superhero"),
    navbarPage("Markeing Funnel"),
                     sidebarPanel(
                                 tags$h3("Marketing Metrics:"),
                                 numericInput("txt1", "Spend on ad", "Enter The Value"),
                                 numericInput("txt2", "Impressions:", "Enter The Value"),
                                 numericInput("txt3", "Clicks:", "Enter The Value"),
                                 numericInput("txt4", "Conversions:", "Enter The Value"),
                                 numericInput("txt5", "Revenue:", "Enter The Value")
                                 
                             ), # sidebarPanel
                             mainPanel(
                                 h1("Results"),
                                 
                                 h4("CPC"),
                                 verbatimTextOutput("txtout1"),
                                 h4("CPA"),
                                 verbatimTextOutput("txtout2"),
                                 h4("ROI"),
                                 verbatimTextOutput("txtout3"),
                                 verbatimTextOutput("message")
                                 
                                 
                             ) # mainPanel
                             
                    ) # Navbar 1,

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$txtout1 <- renderText({ 
        paste(input$txt1/input$txt3)
    })
    output$txtout2 <- renderText({ 
        paste(input$txt1/input$txt4)
    })
    output$txtout3 <- renderText({ 
        paste((input$txt5-input$txt1)/input$txt1)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
