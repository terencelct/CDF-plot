library(shiny)
library(rsconnect)
library(ggplot2)


shinyServer(function(input,output){
  
  Rdata2 <- read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vTuyy94aRkeYWEeISvd6lU17TsII56h8DFxJRMDUz3_8Ln-HQfAN07by4OuCPiRBW7GyEFcbzRF8f4B/pub?gid=1836512180&single=true&output=csv")
  output$density<-renderPlot({
    
    newd <- subset(Rdata2, year==input$year)
    newd2 <-subset(newd,distance<=input$distance)
    newd3 <- as.data.frame(newd2)
    colm <- as.numeric(input$var)
    colm2<- as.numeric(input$scale)
    x <- newd3[,colm]
    plot(ecdf(x))
    
  }
  
  )
  
}
)
