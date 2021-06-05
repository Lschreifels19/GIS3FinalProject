
library(shiny)

# Define UI For Application
ui <- fluidPage(

    # Application Title
    titlePanel("Chicago COVID-19 Data"),

    # Sidebar Setup
    sidebarLayout(
        sidebarPanel(
            #Week Slider Creation for COVID-19 Case Data
            sliderInput("week",
                        "Week End Date (Cases)",
                        min = as.Date("2020-03-07","%Y-%m-%d"),
                        max = as.Date("2021-05-29","%Y-%m-%d"),
                        value = as.Date("2021-01-02","%Y-%m-%d"),
                        step = 7,
                        timeFormat= "%Y-%m-%d",
                        animate=TRUE)
        ,
            #Date Slider Creation for COVID-19 Vaccination Data
            sliderInput("day",
                        "Day (Vaccinations)",
                        min = as.Date("2020-12-15","%Y-%m-%d"),
                        max = as.Date("2021-05-31","%Y-%m-%d"),
                        value = as.Date("2021-01-01","%Y-%m-%d"),
                        step=1,
                        timeFormat= "%Y-%m-%d",
                        animate=TRUE)
                        
         ,
            #Radio Button Creation for COVID-19 Vaccination Statistic Selection
            radioButtons("vaxoption","Vaccination Statistic",
                        c("Doses"="doses",
                          "Doses Total"="ttl_dss",
                          "Percentage Vaccinated"="prcnt_v")
                         )
        ,
            #Checkbox Creation for COVID-19 Vaccination Site Option
            checkboxInput("sites","COVID-19 Vaccination Sites",
                          value = TRUE)
        )
,

        # Show Maps Based on Input Data
        mainPanel(
           plotOutput("map1")
            ,           
           plotOutput("map2")
            ,
           plotOutput("map3")
,

           
        )))
    


# Define Server Logic to Create Maps
server <- function(input, output) {
    
    output$map1 <- renderPlot({
        #Create Selection from COVID-19 Case Data Based on Input Week
        inputweek    <- input$week
        weekselection<- subset(covid,covid$week_nd==inputweek)
        
        #Create COVID-19 Case Map Based on Selected Week
        tm_shape(weekselection)+tm_fill("case_rt",breaks = c(0,25,50,100,150,300,500,1000,2000))+tm_borders()+tm_layout(main.title="COVID-19 Cases per 100k" )}
    )
    
    output$map2<-renderPlot({
        #Create Selection from COVID-19 Vaccination Data Based on Input Date
        inputday <- input$day
        dayselection<-subset(vax,vax$date==inputday)
        
        #Create Selection for Vaccination Statistics and Vaccination Sites Based on Inputs
        inputvaxoption <- input$vaxoption
        inputvaxsites <- if_else(input$sites==TRUE,1,0)
       
        #Create COVID-19 Vaccination Map Based on Selected Date, Statistic, and Location Display Option
        tm_shape(dayselection)+tm_fill(inputvaxoption,pal="Greens")+tm_borders()+tm_shape(vaxsites)+tm_dots(col="blue",alpha = inputvaxsites,size=.25 )+tm_layout(main.title="COVID-19 Vaccinations")}
    )
    
    output$map3<-renderPlot({
        #Display Map for Socioeconomic Data
        tm_shape(poverty)+tm_fill("prcnt_p")+tm_borders()+tm_layout(legend.title.color = "white",main.title = "% of People in Poverty")}
    )
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
