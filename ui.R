
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(png)



shinyUI(fluidPage(

  # Application title
  titlePanel("Grain size distribution"),
  


  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 60,
                  value = 30),
      plotOutput("distPlot")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3(strong('Do you know what is metal looks like under microscope?')),
      h4('Fig.1 shows a plished metal surface under microscope. We could see black lines devide the metal into small zones. Generally, we call these zones "grain".
         The grain size affects the metal property, so we want to know the grain size distribution. '),
      h4('You can slide the slide bar to see grain size distribution.'),
      img(src = "Metal.png",height = 300,width = 400)

    )
  )
))
