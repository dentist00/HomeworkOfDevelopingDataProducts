
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

data <- read.table("GrainSize.txt")
dataNew <- vector("list", length(data[,1]) )
for (i in 1:length(data[,1])){
  dataNew[[i]] <- rep(data[i,1],times = data[i,2]*1000)
}
dataNew <- unlist(dataNew)


library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    GrainSize <- dataNew
    bins <- seq(min(GrainSize), max(GrainSize), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(GrainSize, breaks = bins, col = 'darkgray', border = 'white')

  })

})
