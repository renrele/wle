library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("World Life Expectancy at Birth"),
        sidebarPanel(
                h4('Life expectancy at birth indicates the number of years a newborn infant would live if prevailing patterns of mortality at the time of its birth were to stay the same throughout its life.'),
                tags$body(
                         p('The data is from the website of the ',a(href= "http://databank.worldbank.org/","World Bank"),'.'),
                         p('Life expectancies are available for year of birth between 1966 and 2013.')
                ),
                numericInput('year', 'Year of birth:', 1980, min = 1966, max = 2013, step = 1),
                uiOutput("countrySelector"),
                h2('How to use the app:'),
                p('Select your year of birth, and country of birth.'),
                p('Your selections will be displayed on the right hand side of the page,aswell as the average world life expectancy for your year of birth and the life expectancy for your year of birth and country of birth.'),
                p('The graph displays the trend of world average life expectancy and life expectancy for your country of birth for years of birth between 1966-2013.'),
                p('The blue bar shows the world average life expectancy and life expectancy for your country, for the year of birth you selected.'),
                p('You can change the country of birth and see the appropriate life expectancy and graph.'),
                p('You can change the year of birth and see the blue bar move across the graph.')
        ),
        mainPanel(
                p('Your year of birth is:'),
                verbatimTextOutput("oyear"),
                h4('The average life expectancy over all countries with available data for this year is:'),
                verbatimTextOutput("oworld"),
                p('Your country of birth is:'),
                verbatimTextOutput("ocountry"),
                h4('The life expectancy for the same year of birth in this country is:'),
                verbatimTextOutput("olife"),
                plotOutput("newPlot")
        )
))