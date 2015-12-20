library(shiny)
#unzip("Data_Extract_From_World_Development_Indicators.zip")
world<-read.csv("Data_Extract_From_World_Development_Indicators_Data.csv")
y<-apply(world[,5:54],2,function(x){mean(x,na.rm=TRUE)})

shinyServer(
        function(input, output) {
                i <- reactive({which(world[,3]==input$country)})
                
                output$countrySelector <- renderUI({
                        selectInput("country", "Country of birth:", as.character(world[,3])) 
                })
                output$oyear <- renderPrint({input$year})
                output$oworld <- renderPrint({mean(world[,input$year-1966+5],na.rm=TRUE)})
                output$ocountry <- renderPrint({input$country})
                output$olife <- renderPrint({world[i(),input$year-1966+5]})             
                output$newPlot <- renderPlot({
                         plot(1966:2015,y,ylim=c(30,80),type="l",xlab="years",ylab="life expectancy",main='Life expectancy for year of birth between 1966-2013')
                         lines(1966:2015,world[i(),5:54],col="red")
                         legend("bottomright",legend=c("world average",input$country),lty=c(1,1),col=c("black","red"))
                         lines(c(input$year, input$year), c(0, 200),col="blue",lwd=3)
                         })
        }
)