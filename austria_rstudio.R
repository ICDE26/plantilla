rm(list = ls())
install.packages("tibble")
#setwd("")

gpklink= 'https://github.com/ICDE26/plantilla/raw/main/austria_8857.gpkg'
jsonlink= 'https://github.com/ICDE26/plantilla/raw/main/austria_indicators.json'

library(sf)

map1=read_sf(gpklink, layer = "population")
#map2=read_sf(jsonlink)

library(ggplot2)
map1gg=ggplot() + theme_bw() + geom_sf(data = map1,fill='red', color='grey90')
map1gg

saveRDS(map1gg,file='map1.rds')


map2=read_sf(gpklink, layer = "doctors")
map2gg=ggplot() + theme_void() + geom_sf(data = map2,
                                         aes(size=size))
map2gg

saveRDS(map2gg,file='map2.rds')

map3=read_sf(gpklink, layer = "country")
map3gg=ggplot() + theme_void() + geom_sf(data = map3,
                                         aes(fill= as.ordered(crime_rate_fj5_cat)))
map3gg

saveRDS(map3gg,file='map3.rds')

