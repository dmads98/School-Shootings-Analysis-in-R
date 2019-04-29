# Load packages ------------------------------------------------------------------------
library(shiny)
library(tidyverse)
library(tools)

# Load data ------------------------------------------------------------------------
school_shootings <- read_csv("../data/school-shootings-data.csv")

# Mutate variables -----------------------------------------------------

school_shootings <- school_shootings %>%
    mutate(white_percent = white/enrollment,
           black_percent = black/enrollment,
           hispanic_percent = hispanic/enrollment,
           asian_percent = asian/enrollment,
           american_indian_alaska_native_percent = american_indian_alaska_native/enrollment)

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

school_shootings <- school_shootings %>%
    mutate(high_grade = case_when(high_grade == "PK" ~ 0,
                                  TRUE ~ as.numeric(high_grade)),
           low_grade = case_when( low_grade == "PK" ~ 0,
                                  low_grade == "KG" ~ 0,
                                  TRUE ~ as.numeric(low_grade)),
    )

school_shootings <- school_shootings %>%
    mutate(school_type = case_when(
        is.na(high_grade) ~ NA_character_,
        (high_grade >= 9) ~ "highschool",
        (high_grade >= 6) ~ "middleschool",
        TRUE ~ "elementary"
    ))

school_shootings <- school_shootings %>%
    mutate(resource_officer = case_when(
        resource_officer == 1 ~ "Yes",
        TRUE ~ "No"
    ))

# Define UI ---------------------------------------------------------
ui <- navbarPage("School Shooting Visualizations",
           tabPanel("Bar Graphs",
                    fluidPage(
                        
                        # Sidebar layout with a input and output definitions
                        sidebarLayout(
                            
                            # Inputs: Select variables to plot
                            sidebarPanel(
                                
                                # Select variable for x-axis
                                selectInput(inputId = "x1", 
                                            label = "Choose a variable:",
                                            choices = c("State" = "state", 
                                                        "School Type" = "school_type", 
                                                        "Shooting Type" = "shooting_type", 
                                                        "Locale Type" = "locale_type",
                                                        "School Type" = "school_type",
                                                        "Resource Officer Present" = "resource_officer"), 
                                            selected = "state")
                            ),
                            
                            # Output:
                            mainPanel(
                                
                                # Show scatterplot
                                plotOutput(outputId = "bar"),
                                br()       # a little bit of visual separation
                                
                            )
                        )
                    )
           ),
           tabPanel("ScatterPlot",
                    fluidPage(
                        
                        # Sidebar layout with a input and output definitions
                        sidebarLayout(
                            
                            # Inputs: Select variables to plot
                            sidebarPanel(
                                
                                # Select variable for x-axis
                                selectInput(inputId = "x2", 
                                            label = "Choose an independent variable:",
                                            choices = c("Percent Students White" = "white_percent",
                                                        "Percent Students Black" = "black_percent",
                                                        "Percent Students Hispanic" = "hispanic_percent",
                                                        "Percent Students Asian" = "asian_percent",
                                                        "Percent Students American Indian/Alaska Native" = "american_indian_alaska_native_percent",
                                                        "Percent Students Offered Lunch Benefits" = "lunch_percent",
                                                        "Staffing" = "staffing", 
                                                        "Year" = "year", 
                                                        "Student Enrollment" = "enrollment",
                                                        "Age of Shooter" = "age_shooter1"), 
                                            selected = "state"),
                                # Select variable for color
                                selectInput(inputId = "z", 
                                            label = "Color by:",
                                            choices = c("School Type" = "school_type", 
                                                        "Shooting Type" = "shooting_type", 
                                                        "Locale Type" = "locale_type",
                                                        "School Type" = "school_type",
                                                        "Resource Officer Present" = "resource_officer",
                                                        "Shooter Gender" = "gender_shooter1",
                                                        "Shooter Race" = "race_ethnicity_shooter1"),
                                            selected = "School Type"),
                                # Set alpha level
                                sliderInput(inputId = "alpha", 
                                            label = "Alpha:", 
                                            min = 0, max = 1, 
                                            value = 0.5)
                            ),
                            
                            # Output:
                            mainPanel(
                                
                                # Show scatterplot
                                plotOutput(outputId = "scatterplot"),
                                br()       # a little bit of visual separation
                                
                            )
                        )
                    )
           )
)

# Define server function --------------------------------------------
server <- function(input, output) {
    
    # varInput <- reactive({
    #     switch(input$x,
    #            "State" = "state", 
    #            "School Type" = "school_type", 
    #            "Shooting Type" = "shooting_type", 
    #            "Locale Type" = "locale_type")
    # })
    
    # Create bar graph object the plotOutput function is expecting
    output$bar <- renderPlot({
        ggplot(data = school_shootings, aes_string(x = input$x1)) +
            geom_bar() +
            labs(x = toTitleCase(str_replace_all(input$x1, "_", " "))) +
            coord_flip()
    })
    
    output$scatterplot <- renderPlot({
        ggplot(data = school_shootings, aes_string(x = input$x2, y = school_shootings$casualties,
                                                  color = input$z)) +
            geom_point(alpha = input$alpha) +
            labs(x = toTitleCase(str_replace_all(input$x2, "_", " ")),
                 y = "Casualties",
                 color = toTitleCase(str_replace_all(input$z, "_", " ")))
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
