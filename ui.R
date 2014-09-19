shinyUI(fluidPage(
        
        titlePanel("Air quality in New York from May to September 1973"),
        
        fluidRow(
                
                column(12,
                       # panel that display the plots
                       plotOutput('newAirquality')
                )
        ),
        fluidRow(
                column(4,
                       wellPanel(
                               # checkbox to select all months from the dataset 
                               checkboxInput("allmonths", "Show from May to September", value = FALSE),
                               br(),
                               # slider to select the months available in the dataset
                               sliderInput('month', 'Month',value = 5, min = 5, max = 9, step = 1,)
                               ), 
                       wellPanel(
                               h4("Use instructions:"),
                               p("The checkbox month uses all months in the dataset."),
                               p("The slider allows to select one month (May to Sempteber)."),
                               p("Plots: relation between Temperature and Solar Radiation."),
                               p("Histograms: frequency of highs and lows for temperature and solar radiation, and the red line shows the mean value.")
                               )
                ), 
                column(4,
                       wellPanel(
                                h2("Temperature"),
                                h4("Mean"),
                                verbatimTextOutput("meantemp"),
                                h4("Standard Deviation"),
                                verbatimTextOutput("sdtemp"),
                                h4("Lowest"),
                                verbatimTextOutput("lowtemp"),
                                h4("Highest"),
                                verbatimTextOutput("hightemp")
                               )),
                column(4,
                       wellPanel(
                               h2("Solar Radiation"),
                               h4("Mean"),
                               verbatimTextOutput("meansolar"),
                               h4("Standard Deviation"),
                               verbatimTextOutput("sdsolar"),
                               h4("Lowest"),
                               verbatimTextOutput("lowsolar"),
                               h4("Highest"),
                               verbatimTextOutput("highsolar")
                       ))
        )
))

