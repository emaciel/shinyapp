# Requirements: shiny, datasets and UsingR packages installed

library(UsingR)
library(datasets)

shinyServer(
        function(input, output) {
                monthStr <- c("May", "June", "July", "August", "September")
                output$newAirquality <- renderPlot({
                        
                        if (input$allmonths == TRUE) {
                                # set all variables for displaying all data from the dataset
                                histPlot <- airquality
                                histTitle <- paste("NY Temperature \n May to September 1973")
                                histTitleSolar <- paste("NY Solar Radiation \n May to September 1973")
                        }
                        else {
                                # set all variables for displaying one selected month of data from the dataset
                                histPlot <- airquality[airquality$Month == input$month,]
                                histTitle <- paste("NY (1973) Temperature \n",monthStr[input$month-4], " 1973")
                                histTitleSolar <- paste("NY (1973) Solar Radiatioin \n",monthStr[input$month-4], " 1973")
                        }
                        
                        par(mfrow=c(1,3))
                        
                        # graph with the temperature and solar radiation reading for each day of the dataset in question
                        plot( histPlot$Solar.R, histPlot$Temp, ylab="Temperature (F)", xlab="Solar Radiation", main="Solar Radiation X Temperature" )
                        
                        # histogram of the temperature readings
                        hplot <- hist(histPlot$Temp, main=histTitle, xlab=paste("Temperature (",length(histPlot$Temp)," days)"), breaks=5, col="wheat")
                        hplot
                        # calculate and display on the histogram the mean of the temperature
                        mse <- mean((histPlot$Temp))
                        abline(v=mse, col="red", lwd=2)
                        legend("topright", lty=c(1), col=c("red"), legend= c(paste(round(mse,2), " F")))
                        
                        # histogram of the solar radiation readings
                        hplotSolar <- hist(histPlot$Solar.R, main=histTitleSolar, xlab=paste("Solar Radiation (",length(histPlot$Temp)," days)"), breaks=5, col="salmon")
                        hplotSolar
                        # calculate and display on the histogram the mean of the solar radiation
                        mseSolar <- mean(na.omit(histPlot$Solar.R))
                        abline(v=mseSolar, col="red", lwd=2)
                        legend("topright", lty=c(1), col=c("red"), legend= c(paste(round(mseSolar,2), " lang")))
                        
                        # reactive outputs for the temperature
                        output$meantemp <- renderText ({mean(histPlot$Temp)})
                        output$sdtemp <- renderText ({sd(histPlot$Temp)})
                        output$lowtemp <- renderText ({min(histPlot$Temp)})
                        output$hightemp <- renderText ({max(histPlot$Temp)})
                        
                        # reactive outputs for the solar radiation
                        output$meansolar <- renderText ({mean(na.omit(histPlot$Solar.R))})
                        output$sdsolar <- renderText ({sd(na.omit(histPlot$Solar.R))})
                        output$lowsolar <- renderText ({min(na.omit(histPlot$Solar.R))})
                        output$highsolar <- renderText ({max(na.omit(histPlot$Solar.R))})
                })
                
        }
)
