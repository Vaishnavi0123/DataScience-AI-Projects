require(leaflet)
require(htmltools)
#%Read Data%
IPL<-read.csv('ipl_latlon.csv')

#%Splitting it into subgroups%
chennai_wins <- IPL[which(IPL$winner =='Chennai Super Kings'),]
Deccan_wins <- IPL[which(IPL$winner =='Deccan Chargers'),]
Delhi_wins <- IPL[which(IPL$winner =='Delhi Daredevils'),]
Punjab_wins <- IPL[which(IPL$winner =='Kings XI Punjab'),]
kolkata_wins <- IPL[which(IPL$winner =='Kolkata Knight Riders'),]
mumbai_wins <- IPL[which(IPL$winner =='Mumbai Indians'),]
Rajasthan_wins <- IPL[which(IPL$winner =='Rajasthan Royals'),]
Bangalore_wins <- IPL[which(IPL$winner =='Royal Challengers Bangalore'),]
Hyderabad_wins <- IPL[which(IPL$winner =='Sunrisers Hyderabad'),]
Gujarat_wins <- IPL[which(IPL$winner =='Gujarat Lions'),]
Kochi_wins <- IPL[which(IPL$winner =='Kochi Tuskers Kerala'),]
Pune_wins <- IPL[which(IPL$winner =='Pune Warriors'),]
PuneGiants_wins <- IPL[which(IPL$winner =='Rising Pune Supergiants'),]
Matches_that_tied <- IPL[which(IPL$winner =='nan'),]

trophy <- makeIcon(
  iconUrl = "https://icon-library.com/images/trophy-icon/trophy-icon-21.jpg",
  iconWidth = 36, iconHeight = 36,
  iconAnchorX = 22, iconAnchorY = 94,
)

#%creating map and setting base%
leaflet(IPL) %>% 
  addTiles(group = "OSM (default)") %>%
  addProviderTiles("Esri.WorldGrayCanvas", group = "Esri.WorldGrayCanvas") %>%

  # Overlay groups
  
  addMarkers(data=Hyderabad_wins,lng= ~Lon, lat=~Lat, icon = trophy, group = "Hyderabad_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  #addMarkers(data=Rajasthan_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Rajsasthan_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Bangalore_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Bangalore_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=chennai_wins, lng= ~Lon, lat=~Lat,icon = trophy, group = "Chennai_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Deccan_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Deccan_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Delhi_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Delhi_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Gujarat_wins, lng= ~Lon, lat=~Lat,icon = trophy,  group = "Gujarat_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=mumbai_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Mumbai_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Kochi_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Kochi_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=kolkata_wins, lng= ~Lon, lat=~Lat,icon = trophy,  group = "Kolkata_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Pune_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Pune_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=PuneGiants_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "PuneGiants_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=Punjab_wins, lng= ~Lon, lat=~Lat, icon = trophy, group = "Punjab_wins",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  addMarkers(data=IPL, lng= ~Lon, lat=~Lat, icon = trophy, group = "IPL",popup = ~htmlEscape(paste(team1,"Vs.",team2,"-",date,"-","Winner: ",winner)),clusterOptions = markerClusterOptions()) %>%
  
  # Layers control
  addLayersControl(
    overlayGroups = c("OSM (default)", "Esri.WorldGrayCanvas"),
    baseGroups = c("IPL", "Bangalore_wins","Chennai_wins","Deccan_wins","Delhi_wins","Gujarat_wins","Hyderabad_wins","Kochi_wins","Kolkata_wins","Mumbai_wins","Pune_wins","PuneGiants_wins","Punjab_wins","Rajasthan_wins"),
    options = layersControlOptions(collapsed = FALSE)
  )
  