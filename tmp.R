DB$geopark %>% 
  filter(show_on_map) %>% 
  leaflet() %>% 
  addProviderTiles("Esri.NatGeoWorldMap", options = providerTileOptions(maxZoom = 12)) %>%
  addCircleMarkers(lat = ~latitude, lng = ~longitude, label = ~name, popup = ~quote)
