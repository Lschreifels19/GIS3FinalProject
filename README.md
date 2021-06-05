# COVID-19 Web App

***Note: R packages sf, tidyverse, and tmap must be loaded for this package***

## Goals

  The goal of this RShiny app is to provide users the ability to view Chicago COVID-19 data in an exploratory way, and see how that data relates to socioeconomic status. Large amounts of data such as COVID-19 data can be difficult to view holistically, so this app aims to allow a user to view large amounts of data in a user-friendly way. 

## Motivation and Background

  There have been many studies looking at how COVID-19 has affected people of various income levels. Due to lower income poeple working at more "essential" jobs that operate strictly in-person, they have been more exposed to COVID-19, and have reduced access to good medical care. These along with other factors mean that lower-income individuals have been more greatly affected by COVID-19 on average. Attitudes about poverty in general can be changed by simply seeing how COVID-19 disproportionately affects the poor (Wiwad et. al.). For this reason it is very important that data be displayed in an easily understandable way.

## Data Sources

  The data behind this app comes from the City of Chicago Data Portal and the US Census. Data about Chicago zip code boundaries and COVID related data comes from the Chicago Data Portal, and the socioceonomic data comes from the US Census.

## Scale

  This app looks at data at the zip-code level. This is the level that Chicago provides its COVID-19 data at, so the choice of scale was somewhat determined before this app was created. Looking at a finer scale such as census tracts would potentially provide some more insights, however the general goal of this app can be accomplished at the zip code level. In a temporal sense this app looks at COVID-19 case data going as far back as the week of March 7th, 2020 up to the week of May 29th, 2021, COVID vaccination data from December 15th, 2020 through May 31st, 2021, and socioeconomic data from 2019. 

## Methods

  There are various different methods that went into the design of this web app. Sliders, radio buttons, and a checkbox were incorporated into the input options, as well as the inclusion of animation options to see the progression of COVID cases and vaccinations in a timeline. Custom breaks were also included for the case data, to more easily allow the user to see the change in case rates. The case and vaccination data included entries for every zip code for every week or day respectively. To filter this data based upon a users input, subsetting was used by setting the week end date or date variable in the data sets equivalent to the date input, essentially creating a new dataset observations only falling on those dates. The checkbox indicating if a user wanted to view COVID vaccination sites was turned into a plot by using an if_else function of either a 1 or 0 tied to the alpha of the vaccination site dots.  

## Results

### Input Widget

<img width="287" alt="Screen Shot 2021-06-04 at 10 21 40 PM" src="https://user-images.githubusercontent.com/61601034/120878628-5efda180-c583-11eb-82ca-9efd8042ab2d.png">
This widget allows a user to input week based on end date for COVID-19 case rate, date for COVID-19 vaccination statistics, which vaccination statistic the user wishes to look at, as well as the option to view vaccination sites.

### COVID-19 Case Map

<img width="324" alt="Screen Shot 2021-06-04 at 10 22 52 PM" src="https://user-images.githubusercontent.com/61601034/120878638-69b83680-c583-11eb-8eb0-3dd1fee01d07.png">
This map shows case rate based on week inputted.

### COVID-19 Vaccination Map with Vaccination Sites

<img width="319" alt="Screen Shot 2021-06-04 at 10 23 34 PM" src="https://user-images.githubusercontent.com/61601034/120878667-85bbd800-c583-11eb-8a39-d25bf8ef9567.png">
This map shows various vaccination statistics based upon the inputs selected.

### Percentage of Residents Living in Poverty Map

<img width="270" alt="Screen Shot 2021-06-04 at 10 24 14 PM" src="https://user-images.githubusercontent.com/61601034/120878684-9c622f00-c583-11eb-8904-ca72b6417cc8.png">
This map shows the percentage of residents living in poverty within each zip code.

## Discussion

  This apps functionality as a whole was very much in line with the goals for it. It depicts COVID-19 case and vaccination data in a clear way, and the input functions are very easy to use and understand. The juxtaposition of the poverty data also helps to demonstrate one reason for heavier COVID impacts. The percentage vaccinated data says a lot about inequality in the city, with poorer areas being distinctly less vaccinated. The vaccination locations are also much more clustered on the North and Northwest sides. These components help to clearly communicate the message the app is trying to get across. 

## Limitations and Future Work

  There are a few limitations within this app. Some of the layout functionality of RShiny is somewhat limited or difficult to work with. Improved layout functionality could result in an app that is easier to look at and use. Another limitation in this app is a result of the ESRI shapefile and how it saves. It automatically shortens variable names, and due to a desire to have all data within this repository ready to be used immediately in the app, the variable names in the app are not ideal. While an individual could download the files and app, and change the variable names, saving the file with the new names would result in them being shortened again. Working to create a similar app in something like Carto or Kepler could show to be a better way to convey this important information. 

## Conclusion

  This web app helps to convey very important information to a user, and could potentially help to change how they view poverty and the impact it has on people. There are aspects in which it can be improved, but the overall conveyance of information is there. This app can serve as a starting point for a more comprehensive and in-depth project, which in turn could further the understanding of this very important relationship.  

## Sources

### Data

Levy, Jonathon. “COVID-19 Cases, Tests, and Deaths by ZIP Code.” Chicago Data Portal, City of Chicago, 3 June 2021, data.cityofchicago.org/Health-Human-Services/COVID-19-Cases-Tests-and-Deaths-by-ZIP-Code/yhhz-zm2v. 

Levy, Jonathon. “Boundaries - ZIP Codes.” Chicago Data Portal, City of Chicago, 24 Apr. 2020, data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-ZIP-Codes/gdcf-axmw. 

Levy, Jonathon. “COVID-19 Vaccinations by ZIP Code.” Chicago Data Portal, City of Chicago, 4 June 2021, data.cityofchicago.org/Health-Human-Services/COVID-19-Vaccinations-by-ZIP-Code/553k-3xzc. 

Levy, Jonathon. “COVID-19 Vaccination Locations.” Chicago Data Portal, City of Chicago, 20 May 2021, data.cityofchicago.org/Health-Human-Services/COVID-19-Vaccination-Locations/6q3z-9maq. 

“Poverty Status in the Past 12 Months.” United States Census Bureau, data.census.gov/cedsci/table?q=poverty&amp;g=0400000US17.860000&amp;tid=ACSST5Y2019.S1701&amp;hidePreview=true&amp;moe=false. 

### References

Wiwad, Dylan, et al. “Recognizing the Impact of COVID-19 on the Poor Alters Attitudes towards Poverty and Inequality.” Journal of Experimental Social Psychology, vol. 93, Mar. 2021. EBSCOhost, doi:10.1016/j.jesp.2020.104083.
