library(RMySQL)
drv <- dbDriver("MySQL")
con <- dbConnect(drv, user="root", password = "sqlpass", dbname="flights", host="localhost")
dbListTables(con)
dbListFields(con, "weather")
query <- "SELECT year, month, MAX(wind_speed) AS maxwind 
          FROM weather
          GROUP BY year, month;"
max_wind<- dbGetQuery(con, query)

max_wind