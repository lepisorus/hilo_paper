require(sp)
require(rgdal)
require(raster)
require(ncdf)

Altitude=raster("alt.bil") #altitude data from worldclim
Maize=raster("maize_AreaYieldProduction.nc",level=1) #maize cultivation data from earthstat; first level is percent land cultivated
e<-extent(c(-89.82036,-28.74251,-56.5066,12.90124)) #defines extent of South America
SAAlt<-crop(Altitude,e) #apply extent to altitude layer
SAMaize<-crop(Maize,e) #apply extent to maize layer
a<-SAAlt>1700 #define threshold for altitude
m<-SAMaize>0.01 #define threshold for proportion of pixel under maize cultivation
intersect<-a+m #add layers with raster algebra; layers meeting both criteria (altitude and maize cultivation have value of "2")
plot(intersect, main="Intersect of Maize Cultivation > 0.01 and Altitude >1700m")
ivals<-values(intersect) #creates an object with just the values from the intersect
length(subset(ivals,ivals==2))*100 #gives the area in km^2 of intersect assuming 5 arc-minute resolution--100km^2/pixel
