# Load packages ------------------------------------------------------------------------
library(shiny)
library(tidyverse)

# Load data ------------------------------------------------------------------------
school_shootings <- read_csv("../data/school-shootings-data.csv")

# Define UI ---------------------------------------------------------
ui <- fluidPage(
    
    # App title
    titlePanel("Visualization of School Shooting"),
    
    # Sidebar layout with a input and output definitions
    sidebarLayout(
        
        # Inputs: Select variables to plot
        sidebarPanel(
            
            # Subtitle
            h4("School Shootings Bar Graphs"),
            
            # Select variable for x-axis
            selectInput(inputId = "x", 
                        label = "X-axis:",
                        choices = c("State" = "state", 
                                    "School Type" = "school_type", 
                                    "Shooting Type" = "shooting_type", 
                                    "Locale Type" = "ulocale"), 
                        selected = "state")
        ),
        
        # Output:
        mainPanel(
            
            # Show scatterplot
            plotOutput(outputId = "bar"),
            br(),        # a little bit of visual separation
            
            # Print number of obs plotted
            uiOutput(outputId = "n"),
            br(), br()   # a little bit of visual separation
        )
    )
)

# Define server function --------------------------------------------
server <- function(input, output) {
    
    # Create bar graph object the plotOutput function is expecting
    output$bar <- renderPlot({
        ggplot(data = school_shootings, aes_string(x = input$x)) +
            geom_bar() +
            labs(x = toTitleCase(str_replace_all(input$x, "_", " ")))
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
