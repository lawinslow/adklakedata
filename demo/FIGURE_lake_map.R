# Create lake sites figure
library(ggplot2)
library(maps)
library(rgdal)

ny = subset(map_data('state'), region=='new york')
lakesites = adk_lakes()
adkpark = readOGR(adk_shape())
adkpark = spTransform(adkpark, CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0'))
adk_df = fortify(adkpark)

ggplot() + geom_polygon(data=ny, aes(long, lat, group=group), color='black', fill=NA) +
  geom_polygon(data=adk_df, aes(long, lat), color='blue', fill=NA) +
  theme_minimal() + geom_point(data=lakesites, aes(x=long, y=lat), color=rgb(0.4,0.4,0.4,1), size=1, pch=16) +
  coord_map('lambert', lat0=20, lat1=50)
