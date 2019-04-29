# Load packages ------------------------------------------------------------------------
library(shiny)
library(tidyverse)

# Load data ------------------------------------------------------------------------
school_shootings <- read_csv("../data/school-shootings-data.csv")

# Mutate variables -----------------------------------------------------

school_shootings <- school_shootings %>%
    mutate(white_percent = white/enrollment,
           black_percent = black/enrollment,
           hispanic_percent = hispanic/enrollment,
           asian_percent = asian/enrollment)

school_shootings <- school_shootings %>%
    mutate(lunch_percent = lunch/enrollment)

school_shootings <- school_shootings %>%
    mutate(locale_type = case_when(
        ulocale == 11 ~ "City",
        ulocale == 12 ~ "City",
        ulocale == 13 ~ "City",
        ulocale == 21 ~ "Suburb",
        ulocale == 22 ~ "Suburb",
        ulocale == 23 ~ "Suburb",
        ulocale == 31 ~ "Town",
        ulocale == 32 ~ "Town",
        ulocale == 33 ~ "Town",
        ulocale == 41 ~ "Rural",
        ulocale == 42 ~ "Rural",
        ulocale == 43 ~ "Rural"
    ))

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
                                    "Locale Type" = "locale_type"), 
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
            labs(x = toTitleCase(str_replace_all(input$x, "_", " "))) +
            coord_flip()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
