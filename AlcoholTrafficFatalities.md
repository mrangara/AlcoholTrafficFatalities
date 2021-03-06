AlcoholTrafficFatalities
========================================================
author: Mohan Rangarajan
date: Dec 02 2016
autosize: true

Introduction
========================================================

Most drivers are very familiar with alcohol related accidents. Driving while intoxicated and driving under the influence of alcohol has resulted in some unfortunate accidents

The National Highway Transport Safety Administration has published data regarding different traffic fatalities. A lot of the data is available at http://www-fars.nhtsa.dot.gov/Main/index.aspx

The objective of this application is to display the traffic fatalities associated with Single
and Multivehicle accidents at different times of day. The data used in this exercise is for
all of USA for the year 2014. 

Inputs and Output
========================================================

- A slider bar allows user to choose the time of day range. By specifying this range
  user can choose to see the alcohol related traffic fatalities associated for that
  range. The time range is specified in Military time i.e. 0 represents 00:00 hours
  and 15:00 represents 3:00 pm.
  
- The accident type specifies whether end-user is interested in results pertaining to 
  single vehicle accidents, multi-vehicle accidents or both types of accidents
  
- The search button is used for triggering when the results are to be displayed. 
  Results are based on the parameters specified in the slider bar and the search button.


Methodology
========================================================
- Data for this exercise was derived form the USA NHTSA 
  (National Highway Transportation Safety Administration) website. The 
  results are stored in a file "AlcoholFatalities.csv"

- Using the dplyr package, the filter, select commands are used in
  conjunction with parameters specified in the slider bar and the
  radio button to retrieve the appropriate rows and columns of data

- The above mentioned step is triggered when the user clicks on the 
  Search button provided in the User Interface
  
- Data retrieved is then relayed to the User Interface using an HTML
  table
  
Sample Results
========================================================
The code executed belows shows the results for both single and multi-vehicle alcohol 
traffic fatalities between 3:00AM and 9:00AM


```r
library(dplyr)
fatalityInfo <- read.csv("AlcoholFatalities.csv",sep="\t")
desiredRows <- filter(fatalityInfo, ((StartTime >=3) & (EndTime <= 9)))
desiredColumns <- select(desiredRows, StartTime, EndTime, starts_with("Total"))
print(desiredColumns)
```

```
  StartTime EndTime Total TotalAlcoholRelated TotalPercentAlcoholRelated
1         3       6  2555                1132                         44
2         6       9  3022                 405                         13
```

